Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92ECF416562
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 20:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242794AbhIWSvv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 14:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242793AbhIWSvv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Sep 2021 14:51:51 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FE6C061756
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 11:50:19 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b20so30108488lfv.3
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G+xBDmQPXKsiGLr3VFMM2p7CpCvy6Zy6mjF1IkZrEIc=;
        b=y3X4xo8LVdZMrchYSTb0hQnOCCOXfWzr6tEV4tU2YsVOLgy8fUwLfb1w8hP2yiP2GT
         ZRjEuMxdtKdzMTw1ktv61HJpmLMtARrXWmld/U1ns3nWx3mn1vPDzi6zUry/stv95Mgj
         2KYwwNIMeQ9MWVJQwIPAjHowZrMZEFPqcWRwYwBIZepnKm2qC4OeQNRnuFXWo8q3k9SG
         DT9dDeYx6ajv7y/8OrQ9HdINic5v1tcDb25oKDYb8xSu3GA5AW/eypqW3IttgTkfcAIU
         3FrnVA+hK5lUYEEMuNwQaqKPRYe3U8l1sPLxhZsuBvTh0mFTH3banaEkmb2Hox8BbWnT
         LQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G+xBDmQPXKsiGLr3VFMM2p7CpCvy6Zy6mjF1IkZrEIc=;
        b=QZeRsDHodtZHVBE8wVWlNbC5oVEOVYVLd9j20TKu8TwkNhtTz7XsdwCKU2TBjzlOgq
         qInH1xu1UFRW8I54S++wyuzGdtabXmzKxgCDEsOLNrnVC4t4fgiOVP7HgKJOn9GaiE23
         1wPz2n6fH89eMw0/EPQimkwVfAKoM+Zusn/HXQOpmjsnicayljG6rGejAWWe1YhdimAx
         uH3MktyDXVw0abwdSnfTUUji9cQ1NPWhtBA4f8QiCy0R2VqvU+NYqUU2k55XQQA+laLp
         1HIinTDnFbqqV9VKTa10G+L3HWp5l3kOiUBq3dkzJkY6Tg73ToP3qzAxanSADJCAe3AU
         nF+A==
X-Gm-Message-State: AOAM532zkIaDCx1qIQI5yzknmwaiPxXTh5e9CFBXvTPJdUDNtOEdqshy
        A7K7ApBHsADUeSgSN7QKFZv1FKOOVqG6MEpZA6QdTQ==
X-Google-Smtp-Source: ABdhPJxmuOPc/eEBZuFHS88X/WSvOdyPLq05/U0zOuP+5xD4VGlhAcmpTse2JIvNDLEh6CKIOgsb+rXfqVJ408et2/8=
X-Received: by 2002:a05:651c:20b:: with SMTP id y11mr6770656ljn.463.1632423017540;
 Thu, 23 Sep 2021 11:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631785820.git.mchehab+huawei@kernel.org> <820bb7a1d7e0e51cbea72c9bee6bce806427d1f3.1631785820.git.mchehab+huawei@kernel.org>
In-Reply-To: <820bb7a1d7e0e51cbea72c9bee6bce806427d1f3.1631785820.git.mchehab+huawei@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 23 Sep 2021 20:49:41 +0200
Message-ID: <CAPDyKFrZptmXAfJbf7eUyrQ0dMVSZbpdXw=CfK-LSYbEeMayig@mail.gmail.com>
Subject: Re: [PATCH v2 05/23] dt-bindings: mmc: update mmc-card.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh@kernel.org>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 16 Sept 2021 at 11:55, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Changeset 922eefdafc80 ("dt-bindings: mmc: Convert MMC Card binding to a schema")
> renamed: Documentation/devicetree/bindings/mmc/mmc-card.txt
> to: Documentation/devicetree/bindings/mmc/mmc-card.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: 922eefdafc80 ("dt-bindings: mmc: Convert MMC Card binding to a schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap_hsmmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index 7a29ad542e4a..9dafcbf969d9 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1510,7 +1510,7 @@ static void omap_hsmmc_init_card(struct mmc_host *mmc, struct mmc_card *card)
>                  * REVISIT: should be moved to sdio core and made more
>                  * general e.g. by expanding the DT bindings of child nodes
>                  * to provide a mechanism to provide this information:
> -                * Documentation/devicetree/bindings/mmc/mmc-card.txt
> +                * Documentation/devicetree/bindings/mmc/mmc-card.yaml
>                  */
>
>                 np = of_get_compatible_child(np, "ti,wl1251");
> --
> 2.31.1
>
