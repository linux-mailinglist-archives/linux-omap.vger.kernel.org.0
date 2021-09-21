Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A49B413B90
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 22:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234921AbhIUUmJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 16:42:09 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:43765 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhIUUmJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 16:42:09 -0400
Received: by mail-ot1-f50.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so238965otb.10;
        Tue, 21 Sep 2021 13:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lIsMkc1Ru4Hy+3XDmUohr+N44VuUIeGdNclPrsd8TlE=;
        b=js48BTPV+vp5Zleqz4tK4Ayi5xVY/Nsk0AJKiLpWcnF+jj8KP2FvN9+tWoH9Wr+0U/
         LAi5PGzACHa9OV9k9uvv3aJhGXjhSx4WFeot5ExBckU6WHTRUv18vfudh6arorGvSAFo
         HEIbpOxD5g3bWQSnJC0wZeONgAZuiuq3P8ywgpInxK+TsaWUFozvjgrHBNSIa+FsGO7j
         weq0aoVeBC9QfQXp+l8umjFD/evDLMQLPxOsv/RNZhMcDJSNBAV+rXRBQFTAiE0bk2Qy
         I+DRALw7sMWc/NrSpAbHB3o2RpgtECC2cLLo8i9hiYtFcMgDERjb5HKabr2hNEZPmlRi
         l8Zg==
X-Gm-Message-State: AOAM532NfCsBaKDeC8vXDH+w4+cQzobcX2AbYkLVSs/uNY+8wTm82/rY
        2d+qy0S+J6QYVwaXBUi//A==
X-Google-Smtp-Source: ABdhPJxkU1UAKTiSDKIIDMi5tHNRusRT64dD5UXCiQJ1rdrAm9DpC0NNzmKgqwE0+YNysku5MAzNGA==
X-Received: by 2002:a9d:4b85:: with SMTP id k5mr5955996otf.103.1632256840367;
        Tue, 21 Sep 2021 13:40:40 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id c5sm17580otb.35.2021.09.21.13.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:40:39 -0700 (PDT)
Received: (nullmailer pid 3291297 invoked by uid 1000);
        Tue, 21 Sep 2021 20:40:38 -0000
Date:   Tue, 21 Sep 2021 15:40:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     krzysztof.kozlowski@canonical.com, nm@ti.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nsekhar@ti.com, linux-omap@vger.kernel.org, robh+dt@kernel.org,
        miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
        lokeshvutla@ti.com, grygorii.strashko@ti.com, tony@atomide.com
Subject: Re: [PATCH v4 4/8] dt-bindings: memory-controllers: Introduce
 ti,gpmc-child
Message-ID: <YUpDRkZqQjmfKZgz@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-5-rogerq@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-5-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 14 Sep 2021 15:27:01 +0300, Roger Quadros wrote:
> This binding is meant for the child nodes of the TI GPMC node. The node
> represents any device connected to the GPMC bus. It may be a Flash chip,
> RAM chip or Ethernet controller, etc. These properties are meant for
> configuring the GPMC settings/timings and will accompany the bindings
> supported by the respective device.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../memory-controllers/ti,gpmc-child.yaml     | 245 ++++++++++++++++++
>  1 file changed, 245 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
