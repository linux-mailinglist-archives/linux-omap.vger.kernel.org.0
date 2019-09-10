Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6D8AF290
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 23:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfIJV2L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 17:28:11 -0400
Received: from muru.com ([72.249.23.125]:60538 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbfIJV2L (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Sep 2019 17:28:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 01D3D8027;
        Tue, 10 Sep 2019 21:28:41 +0000 (UTC)
Date:   Tue, 10 Sep 2019 14:28:08 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: omap2plus defconfig cleanup
Message-ID: <20190910212808.GS52127@atomide.com>
References: <CAHCN7xKOZnqPx9jGJmyrdnZ94nemMf+t=SmZTOkeNHwL7echgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKOZnqPx9jGJmyrdnZ94nemMf+t=SmZTOkeNHwL7echgw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190910 15:52]:
> Tony,
> 
> I was going to update the omap2plus to some new modules.
> However, when I do a make savedefconfig ARCH=arm, I get a bunch of
> other stuff that either went away or moved around.  Are you ok if I do
> a patch which just makes a clean  omap2plus_defconfig and then
> re-saves it or would you want to do that?
> 
> This will make the additional module additions easier to manage.

Sure, please do one patch for removed stuff and check that nothing
got removed accidentally and it's really safe to remove with
Kconfig changes. Usually there's a clear reason something got
removed :)

And then a second patch for options that just got moved around.

Thanks,

Tony
