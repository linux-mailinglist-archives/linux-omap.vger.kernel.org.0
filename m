Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39DE287584
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 11:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405571AbfHIJR4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 05:17:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:44736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727063AbfHIJR4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 9 Aug 2019 05:17:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F180921743;
        Fri,  9 Aug 2019 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565342275;
        bh=D+3NRABJ7agk+8lHMrhJNDy5+9YnSH6yVuWNZ2/sFwE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1Ug+Zeb6F1xOhCLjy4WnTAnmTtX/F14z+IjkF86964fsGO+rx0F9i/VEr9vtCL5f6
         EisklBZyTiuW/9YDsM/9Qt2UlsL6ltOifR4oVHApp3JxXxl1DT9KW5NjPyWDckrVCo
         KbxGbbsbgD/bt16IwumBJLstiN9ZshXuozLd/P0I=
Date:   Fri, 9 Aug 2019 07:58:27 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [balbi-usb:testing/next 2/13] drivers/usb/phy/phy-tahvo.c:434:4:
 error: 'struct device_driver' has no member named 'dev_groups'; did you mean
 'groups'?
Message-ID: <20190809055827.GA7355@kroah.com>
References: <201908082335.aajJntgU%lkp@intel.com>
 <875zn6gb6v.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zn6gb6v.fsf@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 09, 2019 at 08:27:52AM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> kbuild test robot <lkp@intel.com> writes:
> 
> > tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/balbi/usb.git testing/next
> > head:   d06a2c3f683a591efce9d02b2b60ef346df5ae02
> > commit: 2a714ea6d90d9d1b510ba424652a2e3dfd547267 [2/13] USB: phy: tahvo: convert platform driver to use dev_groups
> > config: sh-allmodconfig (attached as .config)
> > compiler: sh4-linux-gcc (GCC) 7.4.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout 2a714ea6d90d9d1b510ba424652a2e3dfd547267
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=7.4.0 make.cross ARCH=sh 
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >>> drivers/usb/phy/phy-tahvo.c:434:4: error: 'struct device_driver' has no member named 'dev_groups'; did you mean 'groups'?
> >       .dev_groups = tahvo_groups,
> >        ^~~~~~~~~~
> 
> 
> looks like these patches depend on something else that's not upstream
> yet. I'll drop the patches from my queue. Greg,if you'd like to add my
> ack:
> 
> Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

Thanks, they depend on a patch that is in linux-next and in my tree (and
a few other developer's trees) already.

greg k-h
