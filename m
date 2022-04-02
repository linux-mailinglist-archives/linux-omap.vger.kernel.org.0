Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53D6B4F064E
	for <lists+linux-omap@lfdr.de>; Sat,  2 Apr 2022 22:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiDBUvE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Apr 2022 16:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239719AbiDBUvE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Apr 2022 16:51:04 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73487BD3;
        Sat,  2 Apr 2022 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648932549;
        bh=fVlDjX4soWtG5PVsw+dvVgcGIIgjHU7m5mfUwEgpa7U=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=gFxwsnfsXT++Y15BSl2QongiRT/8zYRtfaNHe50gtxH4M3UOxy1SK33ahafE/0XXy
         xDqBRDyiKrK01D4Hwvr7HuMGxHj8SCjGmCFZG2r2Xfg/48fmRNADi1EEkmgOS7FcUi
         57P5tWUeqT/dACQv+joJmgBX8YHkZuVLYKe1kyEA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.149.42]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1o6Fk605ad-0154lU; Sat, 02
 Apr 2022 22:49:09 +0200
Message-ID: <45b40a58-e95b-2f11-8ade-1a570514eb7d@gmx.de>
Date:   Sat, 2 Apr 2022 22:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] video: fbdev: omap: Make it CCF clk API compatible
Content-Language: en-US
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org
References: <20220402115444.130999-1-jmkrzyszt@gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220402115444.130999-1-jmkrzyszt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RcOIfvmknuN5TsNM5HY+zBZKYxTNYxwrGzmsxECUksIp8ZstpZ2
 j5hFzMRvWKJGHWCYX0hYG2ApvMdwiN7poPZEsbSDLR6i4AV4cyZQ2UMhPeviL0JeRsZtF6A
 qYY+JdD3vIwc8cPwjtdKP1OVGnkIrrvnE/3zC2SMZwRq1Nul47fRCKn/8LPnpyQJ0wOLAmh
 fGy+KUjQsrMvvUdg58ApQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q2nDNAAflaM=:LkKNmzLRHYXgXT4r8u3YS4
 e34IyEiX7SNjv/YIvcDNfNp8aaMtjV4vs5CNAX/XC7th/3pmC2Blf7UL0qRfsAJ1mZ22O+Yvs
 HN3u3sROQJnfGBcbQyna3BXhW0sEpsxmFajtqceWF7Xpf3lBSiMvWBMZy767BgzOB5gnzFRWs
 Ex8reUrijucdD8CgWKYT5xTsfhpYr+Kg+gfQNHnbQvf0NTdNx74+zoWvDQpMIjxjWZ8WATUT/
 jqRFN2zSRxd/YXGpl/0+Yp8q+tdG1GPsT1cRoKnbJNjW7lQ3lnKKYH7CHZdYqe8RyoqMQocpf
 JWnD2wdztQA28hIHjUMKJ4huELc/xdIB+NiSUg63wZ8/OrPn4GmwQO3ZXkSGipqYfi36hPGHz
 svBzafGMxB/CfX1vwkm4hR8bM5XrKRc1dOM4p1R6btWrUnDENAfCUG58OLvlike3TiGMlFh+N
 Z99204rDLZXECztgGiR0M5tTGKsiRr8/tZrbEnvCezMeL/PaSt3/JaN0h3mF5w9R3Pu7k/6A3
 HphvCtMGe8bzqAb974PqKvYXEbMA/kJCjNu5EofOUaXVwJRWKLYRH3NGmxlg90hx0kCCfiq1n
 M/ebiljwoa9uwSQfsQgmKxNkWMVpLow8zpVTnJc9iP544mhsmJtvRz8gCDQV7ir712iMFsHeU
 qYKm65BSBIT+OQMmrHGCIGbvTomkh+x+fzQ9K9UnF6Srdwr1JRcoH/euseO7rymbh6Seyd6Bu
 xMK4BDdhXM4gdv18RA1LKBn4fB7a/1gdssO5jfYGDRCnPqPbpJZYhjTXCqFTAYtYhusN3EYuz
 LRxLRmGc7HSw41xFhmSkmndnWRL50ebTKia4tmG4vlCRrRXTrlBpQJNCSKAcHjEOuTpMfwv+P
 3G+rSp87mbiHQMeDAfPGDQEwQ4vN8NUoGW1hQPjZVO+OIEWAgZdNsKZ3dZUEfe3QlJpZFuAmR
 beAlKPfzX3gPoOO8ZT1pHhF1PdUKrmQQ1OW/jEizK8WDryUuhfzh92zGjteAzglyKnOrtR02s
 G7JjmeEjiTMZzpWIpaQelKEWmrBO1Lf0JkElEQjMAUPhgqW1LQixm12ZytoTFr3NjlkNmKdRV
 ZKpceCohK0HF68=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 4/2/22 13:54, Janusz Krzysztofik wrote:
> OMAP1 LCDC drivers now omit clk_prepare/unprepare() steps, not supported
> by OMAP1 custom implementation of clock API.  However, non-CCF stubs of
> those functions exist for use on such platforms until converted to CCF.
>
> Update the drivers to be compatible with CCF implementation of clock API=
.
>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

applied to fbdev tree.
Thanks!
Helge

> ---
>  drivers/video/fbdev/omap/hwa742.c | 6 +++---
>  drivers/video/fbdev/omap/lcdc.c   | 6 +++---
>  drivers/video/fbdev/omap/sossi.c  | 5 +++--
>  3 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap/hwa742.c b/drivers/video/fbdev/oma=
p/hwa742.c
> index b191bef22d98..9d9fe5c3a7a1 100644
> --- a/drivers/video/fbdev/omap/hwa742.c
> +++ b/drivers/video/fbdev/omap/hwa742.c
> @@ -964,7 +964,7 @@ static int hwa742_init(struct omapfb_device *fbdev, =
int ext_mode,
>  	if ((r =3D calc_extif_timings(ext_clk, &extif_mem_div)) < 0)
>  		goto err3;
>  	hwa742.extif->set_timings(&hwa742.reg_timings);
> -	clk_enable(hwa742.sys_ck);
> +	clk_prepare_enable(hwa742.sys_ck);
>
>  	calc_hwa742_clk_rates(ext_clk, &sys_clk, &pix_clk);
>  	if ((r =3D calc_extif_timings(sys_clk, &extif_mem_div)) < 0)
> @@ -1023,7 +1023,7 @@ static int hwa742_init(struct omapfb_device *fbdev=
, int ext_mode,
>
>  	return 0;
>  err4:
> -	clk_disable(hwa742.sys_ck);
> +	clk_disable_unprepare(hwa742.sys_ck);
>  err3:
>  	hwa742.extif->cleanup();
>  err2:
> @@ -1037,7 +1037,7 @@ static void hwa742_cleanup(void)
>  	hwa742_set_update_mode(OMAPFB_UPDATE_DISABLED);
>  	hwa742.extif->cleanup();
>  	hwa742.int_ctrl->cleanup();
> -	clk_disable(hwa742.sys_ck);
> +	clk_disable_unprepare(hwa742.sys_ck);
>  }
>
>  struct lcd_ctrl hwa742_ctrl =3D {
> diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/=
lcdc.c
> index 7317c9aad677..97d20dc0d1d0 100644
> --- a/drivers/video/fbdev/omap/lcdc.c
> +++ b/drivers/video/fbdev/omap/lcdc.c
> @@ -711,7 +711,7 @@ static int omap_lcdc_init(struct omapfb_device *fbde=
v, int ext_mode,
>  		dev_err(fbdev->dev, "failed to adjust LCD rate\n");
>  		goto fail1;
>  	}
> -	clk_enable(lcdc.lcd_ck);
> +	clk_prepare_enable(lcdc.lcd_ck);
>
>  	r =3D request_irq(OMAP_LCDC_IRQ, lcdc_irq_handler, 0, MODULE_NAME, fbd=
ev);
>  	if (r) {
> @@ -746,7 +746,7 @@ static int omap_lcdc_init(struct omapfb_device *fbde=
v, int ext_mode,
>  fail3:
>  	free_irq(OMAP_LCDC_IRQ, lcdc.fbdev);
>  fail2:
> -	clk_disable(lcdc.lcd_ck);
> +	clk_disable_unprepare(lcdc.lcd_ck);
>  fail1:
>  	clk_put(lcdc.lcd_ck);
>  fail0:
> @@ -760,7 +760,7 @@ static void omap_lcdc_cleanup(void)
>  	free_fbmem();
>  	omap_free_lcd_dma();
>  	free_irq(OMAP_LCDC_IRQ, lcdc.fbdev);
> -	clk_disable(lcdc.lcd_ck);
> +	clk_disable_unprepare(lcdc.lcd_ck);
>  	clk_put(lcdc.lcd_ck);
>  }
>
> diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap=
/sossi.c
> index 80ac67f27f0d..b9cb8b386627 100644
> --- a/drivers/video/fbdev/omap/sossi.c
> +++ b/drivers/video/fbdev/omap/sossi.c
> @@ -598,7 +598,7 @@ static int sossi_init(struct omapfb_device *fbdev)
>  	l &=3D ~CONF_SOSSI_RESET_R;
>  	omap_writel(l, MOD_CONF_CTRL_1);
>
> -	clk_enable(sossi.fck);
> +	clk_prepare_enable(sossi.fck);
>  	l =3D omap_readl(ARM_IDLECT2);
>  	l &=3D ~(1 << 8);			/* DMACK_REQ */
>  	omap_writel(l, ARM_IDLECT2);
> @@ -649,7 +649,7 @@ static int sossi_init(struct omapfb_device *fbdev)
>  	return 0;
>
>  err:
> -	clk_disable(sossi.fck);
> +	clk_disable_unprepare(sossi.fck);
>  	clk_put(sossi.fck);
>  	return r;
>  }
> @@ -657,6 +657,7 @@ static int sossi_init(struct omapfb_device *fbdev)
>  static void sossi_cleanup(void)
>  {
>  	omap_lcdc_free_dma_callback();
> +	clk_unprepare(sossi.fck);
>  	clk_put(sossi.fck);
>  	iounmap(sossi.base);
>  }

