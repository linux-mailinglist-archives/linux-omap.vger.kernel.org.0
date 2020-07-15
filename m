Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1DEC221791
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jul 2020 00:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgGOWL4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jul 2020 18:11:56 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38780 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbgGOWLz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jul 2020 18:11:55 -0400
Received: by mail-io1-f65.google.com with SMTP id l1so3950773ioh.5;
        Wed, 15 Jul 2020 15:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cSCfkxcCcyjHt+Lm+PcX89G7cBf+aHHVtzsrdedDXKc=;
        b=m2SCLWuOj8Cd79C0OJJQsSfjIWae+UAU1SHXdNBfAweIup+rCOP0v6ioGOxDpA7Cst
         ataPw1D4sW2mLGLNZJTgEcD5sn7Fez3oynaEfXrcK7b9Kj3rSa4W9stEIN/iXHnFE3y4
         wGc07HF8ZlTWOUWQyC3YOcOTuOH7FNLeMO1sHTVlq3bG2K+sutYoMhz8NWP0sWCriV6t
         WM6Gm7uMwEtibCfPMMBsnrfj3ENTEZNi7CuZtgzAZOjml2Op4lfCQKPv3EzM3edyTHH3
         iDwbgJsR+ySG3eHtjK4TQq1wy6E92gnKZRs9n+EhLjqOPTrNu54VX9iE9VQtRHBWElxY
         Afdg==
X-Gm-Message-State: AOAM531vNdSF5N9L3tO1em3vW3azXsBvxmLDcrNxmDjwXul/Fqes9pLh
        fjx1+C3nDfg4h32XPGhYtg==
X-Google-Smtp-Source: ABdhPJyKYsSoag/7NVQqzCmE+kWu9QcpiPp5VpZITLoA8fnHrjW4RaA72LtIyG7LK6zeuLC1+oX5tA==
X-Received: by 2002:a5d:97d3:: with SMTP id k19mr1459065ios.45.1594851114865;
        Wed, 15 Jul 2020 15:11:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v5sm1746255ios.54.2020.07.15.15.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 15:11:54 -0700 (PDT)
Received: (nullmailer pid 907327 invoked by uid 1000);
        Wed, 15 Jul 2020 22:11:53 -0000
Date:   Wed, 15 Jul 2020 16:11:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Johnson CH Chen =?utf-8?B?KOmZs+aYreWLsyk=?= 
        <JohnsonCH.Chen@moxa.com>
Cc:     =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        "tony@atomide.com" <tony@atomide.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: omap: Replace UC-8100-ME-T with
 UC-8100A-ME
Message-ID: <20200715221153.GA906180@bogus>
References: <HK2PR01MB3281AFFC8F352E3AE8046645FA660@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK2PR01MB3281AFFC8F352E3AE8046645FA660@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jul 07, 2020 at 10:23:34AM +0000, Johnson CH Chen (陳昭勳) wrote:
> UC-8100-ME-T is deprecated, and UC-8100A-ME is advanced of UC-8100-ME-T,
> so replace UC-8100-ME-T with UC-8100A-ME.
> 
> Signed-off-by: Johnson Chen <johnsonch.chen@moxa.com>
> ---
>  Documentation/devicetree/bindings/arm/omap/omap.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/omap/omap.txt b/Documentation/devicetree/bindings/arm/omap/omap.txt
> index e77635c5422c..f02265a8a0d4 100644
> --- a/Documentation/devicetree/bindings/arm/omap/omap.txt
> +++ b/Documentation/devicetree/bindings/arm/omap/omap.txt
> @@ -167,8 +167,8 @@ Boards (incomplete list of examples):
>  - AM335x phyBOARD-REGOR: Single Board Computer
>    compatible = "phytec,am335x-regor", "phytec,am335x-phycore-som", "ti,am33xx"
>  
> -- AM335X UC-8100-ME-T: Communication-centric industrial computing platform
> -  compatible = "moxa,uc-8100-me-t", "ti,am33xx";
> +- AM335X UC-8100A-ME: Communication-centric industrial computing platform
> +  compatible = "moxa,uc-8100a-me", "ti,am33xx";

You can't just change compatible strings. They are an ABI.

>  
>  - OMAP5 EVM : Evaluation Module
>    compatible = "ti,omap5-evm", "ti,omap5"
> -- 
> 2.11.0
