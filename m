Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7233511F42C
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2019 22:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfLNVKM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Dec 2019 16:10:12 -0500
Received: from mout.gmx.net ([212.227.15.19]:60731 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726687AbfLNVKM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Dec 2019 16:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1576357790;
        bh=TXBkusM4pGGyyc42JuzHWCOIuM+BLDKgM7c9ve9GIqY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=fPMD/xFJTCMs3LrZKukP4l0lDeb4LAswt9Po2OEfDOnyP7Of0Q7+SXPW2cfh0cthX
         0jru4yctgV1TSvFu9w3k1IKhWOYBCyxoIMQXK5FtviVN6I6l5XEyXlk49vTCbmbKnr
         89ls6eAV9lHcD9tv3lb6VSWzUlQfeJ7ceo9Bu3Tc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.176] ([37.4.249.154]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUGi9-1iG4ib0WSR-00REKH; Sat, 14
 Dec 2019 22:09:50 +0100
Subject: Re: [PATCH] ARM: bcm: Fix support for BCM2711 SoC which breaks other
 ARM platforms
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     letux-kernel@openphoenux.org, Tony Lindgren <tony@atomide.com>,
        linux@armlinux.org.uk,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rpi-kernel@lists.infradead.org, kernel@pyra-handheld.com,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
References: <33662723d61a80669390abc1e592eb006d8709f1.1576353784.git.hns@goldelico.com>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <a78dbb9c-31ee-90c6-6bb6-6f6448c8208e@gmx.net>
Date:   Sat, 14 Dec 2019 22:09:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <33662723d61a80669390abc1e592eb006d8709f1.1576353784.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:W19swVnhvLWklH1Ap3rdgPxUw/2Kp/bVdKN4sEQ/PBWwjnDI5b2
 A48uwBM4gtkWr80+vegiKsJV+Cszcb/2mvAIKzGjIsy0KRO7ZYWbG6Uu7Oj0Fa46hkNBht2
 w+/WFYA7GcddJKwDk/amdibedXDP/G0MJLHfpeNHFkCFDZHULdWgqQAkqvyoU7o9sdNHDSu
 vIZ9xgkq+MwWtwu+3yl1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tN3rSwrH9Ok=:yigtH0PU6m6NjmVpqOiYkl
 1vLoM48c66zGlX+gVDVUttKOoFJ8RkNqQ6sxj4dKtO4Z7ACo+I5+UioIVbSwLSxrDyUvP5nFz
 iOAnsTXtnaOecrOJKR4DObXhW5FahpQFOKQ5lfZQ8zZWulSuDaM1hNz+8MUQ3Vr09ibunC7e/
 BIOXbeuQeucovK/253kqe2p2wTMvbIp46zl42xkhxupUWT3FyZ7TThlQ4KvRCsG7TEtTuPZ+W
 hB8dS8O+uVEQpOYnTd6yl3jWX5hJMLZ8XweT5ZWS2aeGBBQaNBnq22NosasqxsFsBDSF411/Y
 k0RH+rWns3jwcZbv0OUCcPxdGo2pXJFXVexYi5fid1auhLWA7iDrX95+yCq0V9cZD7NuxDRXL
 Xm3kKAv7z05d9P8OxhVfxIqfml32rEI7KxpsruNUN5yeqc0RDocd+Xpj86JOXERvfrwVCbDYh
 g9X5lG3P880nq/zZ0dRD/RPzb6iMM7PNhS7gBIz3jVz99LGOtV0qSSHb8v6ztyflRRRoRope5
 U4yjuz/4RDoQo7hB7QrwySIhqX3tgVTWHFNyL1dMrXb0wqfRaTMzToXc7AUM6A4jYZkr5mP00
 4m9aL1afP1PW66vQd+H1heo4MLK5szRHlniGgzLntiZJpaqMQY0/dD6I/McfpW1Cvdul8N3q6
 n5gja47RHBkVOSQtrJ3NwCwNwqipKmxJ78PWsBWIEM1QSPBEtZq3bv60u4MxdQIAJtDPvg+AO
 CWC7+U17H7LweSTF9NFv+hNo9aCFfWgPju2yBc4++VVrdmrHobNOrkSbES1QWZ/D+5fT8z6ON
 mepwGtjD3QYF4ZvafYJ2O0ge1EO4LJz3OAyVGKtaxsNBTzeKYSw44FWmFP0i0JVQAIQ4gyoU3
 GxaIv3y4TxCkUyDk8Prn7qHgRwrLCY9G/Ov1LkwfpImispxH9MjmVAsMPaMYKYeRS/sqtx2T1
 CQJKrqKWqy1vj2Gyda7iC6e5D+eaElyYRCDqEDXatu1croxR8mc2uu4B8kisFTP4CN/nsR5G6
 sqJt5DYiiQX2o8lKPC3UMuoGHcGSHO30NS/XxFw15+//jxAdEO1h6/jvEAQkHEc8c/cprnWSe
 5AEc2ohhNTdAwSmBk1mSf/8lMhxCvyn42BYb29bn+Vo9S4M8eQeasKS1odgKH0SYaT0roEdMb
 1x8roXR4lnOsPbuhlKJS5rSeeQHZblDZwHuxF20RpezSQxODyKwmtZPPsqGwSWP7/haUkIes+
 VkmA08KzuSEB/NdZhGeeRH61SWfc0S8Sgra922cOBHxvxi2Fmm2XCpxeS88s=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus,

Am 14.12.19 um 21:03 schrieb H. Nikolaus Schaller:
> commit 781fa0a95424 ("ARM: bcm: Add support for BCM2711 SoC")
>
> breaks boot of many other platforms (e.g. OMAP or i.MX6) if
> CONFIG_ARCH_BCM2835 is enabled in addition to some multiplatform
> config (e.g. omap2plus_defconfig). The symptom is that the OMAP
> based board does not show any activity beyond "Starting Kernel ..."
> even with earlycon.
>
> Reverting the mentioned commit makes it work again.
>
> The real fix is to add the missing NULL sentinel to the
> bcm2711_compat[] variable-length array.
>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

could you please add a Fixes tag. Apart from that

Acked-by: Stefan Wahren <wahrenst@gmx.net>

Thank you
Stefan

> ---
>  arch/arm/mach-bcm/bcm2711.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-bcm/bcm2711.c b/arch/arm/mach-bcm/bcm2711.c
> index dbe296798647..fa0300d8c79d 100644
> --- a/arch/arm/mach-bcm/bcm2711.c
> +++ b/arch/arm/mach-bcm/bcm2711.c
> @@ -13,6 +13,7 @@ static const char * const bcm2711_compat[] =3D {
>  #ifdef CONFIG_ARCH_MULTI_V7
>  	"brcm,bcm2711",
>  #endif
> +	NULL
>  };
>
>  DT_MACHINE_START(BCM2711, "BCM2711")
