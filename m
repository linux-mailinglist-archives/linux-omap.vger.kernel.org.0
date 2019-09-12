Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAF0B15B5
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 23:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbfILVJl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 17:09:41 -0400
Received: from muru.com ([72.249.23.125]:60632 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728249AbfILVJl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Sep 2019 17:09:41 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 218FE80B6;
        Thu, 12 Sep 2019 21:10:11 +0000 (UTC)
Date:   Thu, 12 Sep 2019 14:09:37 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     =?utf-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Kevin Hilman <khilman@ti.com>,
        Thara Gopinath <thara@ti.com>,
        Shweta Gulati <shweta.gulati@ti.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/3] OMAP3: PM: Set/clear T2 bit for Smartreflex on TWL
Message-ID: <20190912210937.GU52127@atomide.com>
References: <20190801012823.28730-1-neolynx@gmail.com>
 <20190801012823.28730-2-neolynx@gmail.com>
 <CAHCN7x+Vd+ECoa4fmUfoX47znag+NxKSzRt3iouQCZ2CQ2T--A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+Vd+ECoa4fmUfoX47znag+NxKSzRt3iouQCZ2CQ2T--A@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190912 19:00]:
> On Wed, Jul 31, 2019 at 8:29 PM André Roth <neolynx@gmail.com> wrote:
> >
> > From: Thara Gopinath <thara@ti.com>
> >
> > Voltage control on TWL can be done using VMODE/I2C1/I2C_SR.
> > Since almost all platforms use I2C_SR on omap3, omap3_twl_init by
> > default expects that OMAP's I2C_SR is plugged in to TWL's I2C
> > and calls omap3_twl_set_sr_bit. On platforms where I2C_SR is not connected,
> > the board files are expected to call omap3_twl_set_sr_bit(false) to
> > ensure that I2C_SR path is not set for voltage control and prevent
> > the default behavior of omap3_twl_init.
> >
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > Signed-off-by: Thara Gopinath <thara@ti.com>
> > Signed-off-by: Shweta Gulati <shweta.gulati@ti.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Kevin Hilman <khilman@ti.com>
> 
> Tony,
> 
> Is there a status update on this series?  It's been several months,
> and I haven't seen any feedback on it, nor does it appear to be in any
> of your branches that I can see.

Well it was tagged RFC.. Does something need updating
with it?

At least the first two patches looked OK to me.

Regards,

Tony
