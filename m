Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 825FA5EFD7E
	for <lists+linux-omap@lfdr.de>; Thu, 29 Sep 2022 21:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiI2TAK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Sep 2022 15:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiI2TAI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Sep 2022 15:00:08 -0400
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA8B32AAF;
        Thu, 29 Sep 2022 12:00:05 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id c22-20020a4a4f16000000b00474a44441c8so739061oob.7;
        Thu, 29 Sep 2022 12:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=OFGMKTBIKXzY7RbnuxUcCfHrcyPmoIfq3/ekm8IS/J8=;
        b=TFbVuewu+PEL934ErJNlF1GFMWSHL9ec6JkeJf5xQ2cJAP+HtxzEqWAkuwaPsecQyk
         CHBlQcs+Ci49Xlxgn+P2YNzGA1XNuObYCkQ6MQ/NiS1b1c7Ba+1mjGc1PaocSfRdGRPr
         91ScDG1MlSQg9jZ5muEBnAtRlB8qaN1ztcC0Of+jLdWB5EE/G+hlGNw/eT6Rib+tVbys
         sf8YSYvfTjlDoLBkYANyJXA3lTw/+FNfGMkg+HQ0GER+MwgnrH9stLgDnAST4Lf1PB9n
         G001opXAHYiXvM7R+TvIOT8Mvw4MOryYkl7DLnnI0ndZLIAHO48XkTnFI086KW5Ema85
         MwFw==
X-Gm-Message-State: ACrzQf1ClNnYjx7d8vTGp3FGpgV2yAu9pFWlKxQunfQqELTznczmVwTM
        6tvv/9nqGmiuOCOyHciT8g==
X-Google-Smtp-Source: AMsMyM78l0bKta6KhJ9yd5tzxZmfami/B6QFg0q57ma0qwy3bufYEde44Dv8ZGNeO+Wh6aEnbrO5gg==
X-Received: by 2002:a9d:73cc:0:b0:659:9686:5563 with SMTP id m12-20020a9d73cc000000b0065996865563mr2149968otk.40.1664478004395;
        Thu, 29 Sep 2022 12:00:04 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s4-20020aca5e04000000b0033b31480f38sm35548oib.34.2022.09.29.12.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:00:03 -0700 (PDT)
Received: (nullmailer pid 2580297 invoked by uid 1000);
        Thu, 29 Sep 2022 19:00:03 -0000
Date:   Thu, 29 Sep 2022 14:00:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, Keerthy <j-keerthy@ti.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Nishanth Menon <nm@ti.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] dt-bindings: timer: Add power-domains for TI timer-dm on
 K3
Message-ID: <166447799743.2580140.1277507917394548082.robh@kernel.org>
References: <20220919112357.64997-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919112357.64997-1-tony@atomide.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 19 Sep 2022 14:23:57 +0300, Tony Lindgren wrote:
> On K3 SoCs, the power-domains property is needed. On the earlier SoCs,
> the power-domains property is handled by the interconnect target module
> parent device.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/timer/ti,timer-dm.yaml  | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 

Applied, thanks!
