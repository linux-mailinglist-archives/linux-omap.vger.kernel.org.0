Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60AFED1973
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 22:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbfJIUNR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 16:13:17 -0400
Received: from muru.com ([72.249.23.125]:36368 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729535AbfJIUNR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 16:13:17 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CA4D38140;
        Wed,  9 Oct 2019 20:13:50 +0000 (UTC)
Date:   Wed, 9 Oct 2019 13:13:14 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>
Subject: Re: [PATCH] ARM: dts: omap3.dtsi: Fix AES and SHA Engines
Message-ID: <20191009201314.GP5610@atomide.com>
References: <20190925171444.9904-1-aford173@gmail.com>
 <CAHCN7xL6OXkWxY1r=ALhHpufDan6AsWkoRkv9JGST52qFJsNCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xL6OXkWxY1r=ALhHpufDan6AsWkoRkv9JGST52qFJsNCQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191009 18:56]:
> On Wed, Sep 25, 2019 at 12:14 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > The AES and SHA engines for the OMAP3 are currently not functional.
> > When the stopped working is unknown, but we have a regression.
> >
> > This patch uses the ti,sysc-omap2 to address the issue and enables
> > to the AES and SHA engines on the DM3730 and OMAP3530 to work once
> > again.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> Tony,
> 
> Any chance these could get review and/or pushed for 5.4 since they
> used to work and now they don't.  I didn't do a bisect, so I didn't
> add a 'fixes' note, but this patch seems to fix a regression.

Well let's rather tag them with fixes tag and that way they get
merged to stable kernels when ready.

I'd rather not hastily start adding devices hastily during the -rc
cycle as by the time we get there with few weeks in next we're
already too close to the merge window.

And my guess is that this stuff has been broken for many years
and nobody cared until now.

A fixes tag would be good to know though.. And maybe we can get them
working with hwmod data for v5.4-rc cycle with just a minimal change?

Regards,

Tony
