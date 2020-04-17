Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B97D1AE149
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 17:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgDQPgw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 11:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728956AbgDQPgw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 11:36:52 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E88C061A0C;
        Fri, 17 Apr 2020 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vcwymhpAC/15yRZg8+DeqjyOHNYHJOED4/yGfBW+CMM=; b=OdW7KdXpbReAT9Bswx0vdyF4Bg
        6QpD7/O0aVes/1sBIYlgy4IqVSSIqFm2hyOgN0xDYJ4Y5kND5Lyqvi2JfBk+I8YL5jwoy+FMS0G6X
        PJaGK1/olpjxt0QG2APOlf86lc9vkTimQVdq1rB5+SO6naKsk199jtwlNw3Gyz7Nl8ZE=;
Received: from p200300ccff0bc3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:c300:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1jPT2r-0008JZ-I8; Fri, 17 Apr 2020 17:36:46 +0200
Date:   Fri, 17 Apr 2020 17:36:44 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200417173644.03c99166@aktux>
In-Reply-To: <20200417151447.GM37466@atomide.com>
References: <20191217004048.46298-1-tony@atomide.com>
        <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com>
        <20200416184638.GI37466@atomide.com>
        <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
        <20200417164340.3d9043d1@aktux>
        <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com>
        <20200417150721.GL37466@atomide.com>
        <20200417151447.GM37466@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 17 Apr 2020 08:14:47 -0700
Tony Lindgren <tony@atomide.com> wrote:

> * Tony Lindgren <tony@atomide.com> [200417 15:08]:
> > Maybe the PM runtime usecounts get unbalanced somewhere in the
> > driver where we end up with driver permanently in disabled state?  
> 
> Or it could be that with omap_hdq.c no longer blocking SoC
> deeper idle states, omap_hdq.c now loses context if you have
> omap3 off mode enabled during idle?
> 
I run twice (to get mmc access cached):

root@(none):/# sleep 15 ; /usr/local/bin/idledump >/run/idledump ; cat /sys/cla
ss/power_supply/bq27000-battery/current_now ; cat /run/idledump 
32665
     CM_IDLEST1_CORE 00000042
     CM_IDLEST3_CORE 00000000
     CM_FCLKEN1_CORE 00000000
     CM_FCLKEN3_CORE 00000002
     CM_CLKSTST_CORE 00000003
     CM_IDLEST_CKGEN 00000001
    CM_IDLEST2_CKGEN 00000000
       CM_FCLKEN_DSS 00000000
       CM_IDLEST_DSS 00000000
       CM_FCLKEN_CAM 00000000
       CM_IDLEST_CAM 00000000
       CM_FCLKEN_PER 00000000
       CM_IDLEST_PER 00030000
root@(none):/# 
root@(none):/# cat /sys/kernel/debug/pm_debug/count 
usbhost_pwrdm (ON),OFF:754,RET:9148,INA:0,ON:9903,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
sgx_pwrdm (OFF),OFF:1,RET:0,INA:1,ON:2,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
core_pwrdm (ON),OFF:0,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0
per_pwrdm (ON),OFF:237,RET:1202,INA:0,ON:1440,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
dss_pwrdm (ON),OFF:754,RET:9148,INA:0,ON:9903,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
cam_pwrdm (OFF),OFF:1,RET:1,INA:0,ON:2,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
neon_pwrdm (ON),OFF:638,RET:9015,INA:250,ON:9904,RET-LOGIC-OFF:0
mpu_pwrdm (ON),OFF:638,RET:9014,INA:250,ON:9903,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
iva2_pwrdm (OFF),OFF:1,RET:1,INA:0,ON:2,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0,RET-MEMBANK3-OFF:0,RET-MEMBANK4-OFF:0
usbhost_clkdm->usbhost_pwrdm (1)
sgx_clkdm->sgx_pwrdm (0)
per_clkdm->per_pwrdm (16)
cam_clkdm->cam_pwrdm (0)
dss_clkdm->dss_pwrdm (1)
d2d_clkdm->core_pwrdm (0)
iva2_clkdm->iva2_pwrdm (0)
mpu_clkdm->mpu_pwrdm (0)
core_l4_clkdm->core_pwrdm (21)
core_l3_clkdm->core_pwrdm (1)
neon_clkdm->neon_pwrdm (0)

Regards,
Andreas

