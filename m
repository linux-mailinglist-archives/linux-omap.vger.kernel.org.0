Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0832841A308
	for <lists+linux-omap@lfdr.de>; Tue, 28 Sep 2021 00:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237663AbhI0WeD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Sep 2021 18:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237879AbhI0WeC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Sep 2021 18:34:02 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A10DC06176F
        for <linux-omap@vger.kernel.org>; Mon, 27 Sep 2021 15:32:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b20so84345394lfv.3
        for <linux-omap@vger.kernel.org>; Mon, 27 Sep 2021 15:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DMB4uEvQ0xVrD8Va6J2iEK6E/SkN/sPqQLy12BaukGc=;
        b=Ocvt4nNiCJOqVLkC9W3p356vc5csAvL5pLJ13h8XPW8trbNtFaIUVNv7mumrKE9Lta
         gcCk7oDxWmM17/f/NKWtizEG59pXAjMXZQmltDRXTFj3dWjxCl9rTft57VO6li4yWr1B
         AbgIH2WytDlNVw1rF+XJL3Nj8cLUzfBRtGy87wKrFtJ6Af1WqhVWn6eooD+BFppmLQ7b
         TkN603eiWwcAInfD0bsL7XyJR9EUqpVbiZcyyrgOIfwOmlNDHUU57SzMeMZocmp8u3qw
         2RACZ5DcBDyb6B4v2a2dkwGPSH9VyfLTowxSy/obkHqqfb7MxOKvt9jNXTEH4YRudCGS
         mvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DMB4uEvQ0xVrD8Va6J2iEK6E/SkN/sPqQLy12BaukGc=;
        b=Ze/uskDZPbl94tCYIOZR7t6juwr5cj/lB2ie9aD8FgBe6NrFu9wkZ7nE57X7ZAt5d1
         9nmP6Qezefvfyt0k08glmALYpAHtxdh3JuDlA9Rw7wlTjWnrt6LEaCDtSYC9DNm7L72e
         +wDKsHurWwzzqitRizLqTkTq77bV4ebtj0VoqkSv+LubWH79ERgDcJtuEtCd4PWsk+08
         zFLbT94XhcHm9eU4FEPPu56TkDOEWTHiY9lUZsOhW5ll9Cmup9XHpy7Bpa3MZ99MzK6U
         Mv14aSqEuJHoO2qCdcu2Om+rxGW2KzMfo4N3HHg0cUP6Cpq0EtG+Y7+ajFP+p6iB9NLs
         UQcA==
X-Gm-Message-State: AOAM532qc7OBNAaAqL+VDCWpIxGFVAVLuF/cNLWK9/t5JPdWsB53831k
        gKFk3zTkeGtoN6a5kh9yzFh92ObN8ONA4raFSZAjbw==
X-Google-Smtp-Source: ABdhPJy5S/UJseOoADDBSALYznDfpb/mX97baRse3NaikYI0hAJV3/+tDHz8WgddNqOPuo4UZWWx6twW/GK4Tjgi138=
X-Received: by 2002:ac2:4157:: with SMTP id c23mr2148581lfi.184.1632781940116;
 Mon, 27 Sep 2021 15:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210924073441.7835-1-tony@atomide.com>
In-Reply-To: <20210924073441.7835-1-tony@atomide.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 28 Sep 2021 00:31:44 +0200
Message-ID: <CAPDyKFqnJw+D307X93TdLagtnratuMM7Fwi=qceedA9J=Cn9ww@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: sdhci-omap: Document ti,non-removable
 property as deprecated
To:     Tony Lindgren <tony@atomide.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 24 Sept 2021 at 09:34, Tony Lindgren <tony@atomide.com> wrote:
>
> Nowadays the standard non-removable property should be used, but we
> still need to parse the ti,non-removable too. Let's document it as a
> deprecated property.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-omap.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
> --- a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
> @@ -28,6 +28,9 @@ Optional properties:
>                 DMA specifiers listed in dmas. The string naming is to be "tx"
>                 and "rx" for TX and RX DMA requests, respectively.
>
> +Deprecated properties:
> +- ti,non-removable: Compatible with the generic non-removable property
> +
>  Example:
>         mmc1: mmc@4809c000 {
>                 compatible = "ti,dra7-sdhci";
> --
> 2.33.0
