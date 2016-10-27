<?php

namespace moi\CrudBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('moiCrudBundle:Default:index.html.twig');
    }
}
