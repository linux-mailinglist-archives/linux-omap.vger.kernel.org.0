Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFF1413BB6
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 22:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhIUUsy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 16:48:54 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:33766 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235083AbhIUUsu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 16:48:50 -0400
Received: by mail-ot1-f41.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso420374otu.0;
        Tue, 21 Sep 2021 13:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ngLxYzAUznjWSLFmvKia/nTu1IkrbcVJEhriv6IKScU=;
        b=DaaoGGSKaR24c6+gg1LTg/68YTdOMC3ZZ66PJzZfVZqgJgJ/E45sfi+4vM7L7S4elx
         jQ8AAWYtrisdX3hvtq2XhqR/tnr2gI3yLxhX3Lwb4kO5VnnZlhKn/ww90CyD5amY21i6
         USMVznhJ7x363O7wMnV018haSl8uvhz16wDc0srrsMfLEGLxqet6l3PWpxQExQx8aGb5
         x8FMwRiLvNLPp6lqjc3y9zYaYWRaUWVOBnN0KR8POD20gaJuNIAIsIf7qtONU7JZ3V3j
         bG7G5hD49dn6g9x7zcY3d7wHU5xjr+FKyiMMP/BrT6wBKUK3+32zjOhRtTspU3Y2+zY4
         +mbw==
X-Gm-Message-State: AOAM530YrdKv1Oj1uPA5YVR+e/47TsqtCFTSO8afhsw0wSv3YfG0TN62
        AI39n+pSiO8b1qxOnyfLE/fG8RTbBA==
X-Google-Smtp-Source: ABdhPJyxA75ILu4OIkNdfN8D3bBIqHF+zc2A+ALEEcje+US3CUJMYK5KMX0DOFOZSqk3dr4qD52SqQ==
X-Received: by 2002:a9d:724a:: with SMTP id a10mr27075485otk.323.1632257240826;
        Tue, 21 Sep 2021 13:47:20 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id j10sm18834oiw.32.2021.09.21.13.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:47:20 -0700 (PDT)
Received: (nullmailer pid 3300155 invoked by uid 1000);
        Tue, 21 Sep 2021 20:47:18 -0000
Date:   Tue, 21 Sep 2021 15:47:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     grygorii.strashko@ti.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, nsekhar@ti.com, tony@atomide.com,
        linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com,
        krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
        linux-mtd@lists.infradead.org, lokeshvutla@ti.com, nm@ti.com
Subject: Re: [PATCH v4 7/8] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
Message-ID: <YUpE1mBqElmjv+wV@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-8-rogerq@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-8-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 14 Sep 2021 15:27:04 +0300, Roger Quadros wrote:
> Convert omap-gpmc.txt to ti,gpmc.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt | 157 ----------------
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 172 ++++++++++++++++++
>  2 files changed, 172 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
