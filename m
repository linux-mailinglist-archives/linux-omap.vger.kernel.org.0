Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374D144D657
	for <lists+linux-omap@lfdr.de>; Thu, 11 Nov 2021 13:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbhKKMNn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Nov 2021 07:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbhKKMNm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 Nov 2021 07:13:42 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49188C0613F5
        for <linux-omap@vger.kernel.org>; Thu, 11 Nov 2021 04:10:53 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id u22so4679589lju.7
        for <linux-omap@vger.kernel.org>; Thu, 11 Nov 2021 04:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mVYKVIklyAhOeKYt/Djeg3160H0V9y1eVTKBm55rYr4=;
        b=k3q5rOXFghTofEhfgNFZGn72Byg4WZL2YMlU6dcRFOH29E5OyE3PdQ0M6W1RFKUZOo
         xWLww/RlEIby7RDSU/5H1KWl8+vtnxd3rGXQuU7T9UFtiSvVGWGc+A6OvPxp/+Dur9nC
         WCYs48v2xKH3SjEsyiCmAWgKUXDHVfWfANcRXrumWUOEog/P6Pk3OOq7WbLCW19a9kvj
         D3kj2DPxIf4BhHrVZUi4xJr3HwXqdMkp/uRl49atKJ3KliyTwzqIFbLpIyjpa3BlHDvh
         6u+oL8zRKeXi7mKqlrBnXuxsNs4/IsJtkwrWRm3vGSBd61HiKtOyWYqSeZIXeMPPKTWL
         jwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mVYKVIklyAhOeKYt/Djeg3160H0V9y1eVTKBm55rYr4=;
        b=6o8yZ3IKakDH+yIR7MfeX374HGgu0v1MSNmiQuFa6cNKec3h3T/rQcG+syKBo+k1+r
         +H+hhCoNUFUQ3COJytiJU0stjHzF8B0gHCmt/WVnauBF1P3gsNlYP88yGbOtbXFwX7fV
         nddFnDe2pLKaDTPkCfmQ7W54Ho4x0l8rPwcEZoDvVTJ221V7+Ykx2yfG7/cjCed3mBF8
         yR09cOvnNn+sB7gGqJVuM4ca/xPUbrlswiUsPqL+yXWujTbz8BfEFcWz9gfTiMtCpgmb
         6fSt171qhVZIpIiBtxM+cUW3m5kFZAVjv+MdaLLFlEMxrlN0GE6pGKmdNcBgcRKLKwLE
         7l5A==
X-Gm-Message-State: AOAM530d9Ksu5NOcEilvUNGOg70UARs1rUGyRS8/7YzKE1mhJfeG34Dr
        GnssBTe3lS8n+AZV4ak1cJX6kgxjZ2mVplEppUXuaw==
X-Google-Smtp-Source: ABdhPJxou4aoi7oS5hpR0rqworoRVynrLUveORbssI5/aUrXcszt6Nh4XLnfTXeqZb8oc5ikkuX0GL8UbFkNhyUb6/o=
X-Received: by 2002:a05:651c:10b1:: with SMTP id k17mr6595483ljn.463.1636632651450;
 Thu, 11 Nov 2021 04:10:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636564631.git.hns@goldelico.com>
In-Reply-To: <cover.1636564631.git.hns@goldelico.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 Nov 2021 13:10:15 +0100
Message-ID: <CAPDyKFruL-b7VgkuTL+TH5apY_bgjUTBwinYeqM0Xk4cKWP0rg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] mmc: core: extend mmc_fixup_device and transplant
 ti,wl1251 quirks from to be retired omap_hsmmc
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <Jerome.Pouiller@silabs.com>,
        Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Yang Li <abaci-bugfix@linux.alibaba.com>, notasas@gmail.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 10 Nov 2021 at 18:17, H. Nikolaus Schaller <hns@goldelico.com> wrot=
e:
>
> PATCH V2 2021-11-10 18:17:11:
> * remove setting card->ocr =3D 0x80 because it is no longer needed (by H.=
 Nikolaus Schaller <hns@goldelico.com>)
> * include patch "mmc: core: Fixup storing of OCR for MMC_QUIRK_NONSTD_SDI=
O" by Ulf Hansson <ulf.hansson@linaro.org>
>
> PATCH V1 2021-11-09 11:59:08:
> * merge call of mmc_fixup_device for sdio into other commit (suggested by=
 Ulf Hansson <ulf.hansson@linaro.org>)
> * do not call mmc_fixup_device(card, sdio_card_init_methods) for mmc and =
sd interfaces, just sdio (suggested by Ulf Hansson <ulf.hansson@linaro.org>=
)
> * do not use a matching list but a single string constant (suggested by U=
lf Hansson <ulf.hansson@linaro.org>)
> * switched to "[PATCH v1]" (suggested by Ulf Hansson <ulf.hansson@linaro.=
org>)
>
> RFC V4 2021-11-05 10:05:51:
> * remove const from char *const * (Ulf Hansson <ulf.hansson@linaro.org>)
> * use for_each_child_of_node() to scan compatible children (Ulf Hansson <=
ulf.hansson@linaro.org>)
> (see: https://lore.kernel.org/lkml/CAPDyKFpr0kpRXoUACNNSwe8pL1S9wJPjnX+GF=
GS1PNezKCDYzQ@mail.gmail.com/)
>
> RFC V3 2021-11-03 14:00:13:
> * patches have been split into smaller ones a little further
> * propose a new macro for setup of device tree compatible quirks
> * directly include patches by jerome.pouiller@silabs.com
>   in this series
>
> RFC V2 2021-11-01 10:24:26:
> * reworked to not misuse mmc_select_card() but add a call to
>   mmc_fixup_device() right after where host->ops->init_card
>   was called before to apply the wl1251 specific quirks.
>   Device tree matching is done by a new table passed to mmc_fixup_device(=
).
>   suggested by: ulf.hansson@linaro.org
>   based on patches by: jerome.pouiller@silabs.com
>
> RFC V1 2021-10-06 13:24:13:
>
>
> H. Nikolaus Schaller (3):
>   mmc: core: provide macro and table to match the device tree to apply
>     quirks
>   mmc: core: transplant ti,wl1251 quirks from to be retired omap_hsmmc
>   mmc: host: omap_hsmmc: revert special init for wl1251
>
> J=C3=A9r=C3=B4me Pouiller (2):
>   mmc: core: rewrite mmc_fixup_device()
>   mmc: core: allow to match the device tree to apply quirks
>
> Ulf Hansson (1):
>   mmc: core: Fixup storing of OCR for MMC_QUIRK_NONSTD_SDIO
>
>  drivers/mmc/core/card.h       | 36 ++++++++++++++++++++
>  drivers/mmc/core/quirks.h     | 64 +++++++++++++++++++++++++----------
>  drivers/mmc/core/sdio.c       |  5 ++-
>  drivers/mmc/host/omap_hsmmc.c | 36 --------------------
>  4 files changed, 87 insertions(+), 54 deletions(-)
>

This looks good to me, I will queue it up as soon as rc1 is out, thanks!

Kind regards
Uffe
