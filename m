Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF2E9B548D
	for <lists+linux-omap@lfdr.de>; Tue, 17 Sep 2019 19:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbfIQRsU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 13:48:20 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38191 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfIQRsU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 13:48:20 -0400
Received: by mail-oi1-f195.google.com with SMTP id 7so3640918oip.5;
        Tue, 17 Sep 2019 10:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OLNPrRxDPRbWhwGlQA4d3JzAWazNN4nV438P8IDTTRw=;
        b=qUppZ/jUYMWSk6liv8Di9k8s3dqOYhvYOcpmxGDRp2Hi8c4mfQO4JtQwIWJNALtQs+
         P0T+Fg/TlsjM8i4KOUDl7H0QLDU+PYYqkFpZzCqed7TnK7B3KFw1+WS5DUzziWUbLiiR
         n+MqZLFYlVHYg1Ra7MGTG5PXXXa1rR/qrRpw7KPtcKnX5ATgICRdLGNunymHhjwLCbaU
         4apV1PIshSn8jVvtDqIOm3KNQFCeNvLMskedRSDgKstXkMhRZrDEmv8OSq2hgzxGa5Xu
         2Dd8aJGkWUIblYGle9DnEM6OTiiaELOWekAboYx6ygXHZ0JygMkxfaMP363UUgbcV3IV
         VARg==
X-Gm-Message-State: APjAAAW5gq0wNLtrLgZVYiM9DBulH5D8hWXAWSOoklQ6m2fscN3RymJD
        350JKSLsOUDUBQVxrmqQywVoZJ0=
X-Google-Smtp-Source: APXvYqxNJazxNhfPpyZsGDNi6/fGR8tESyF7OTgG4GBaUNLvJb1qsI+fGEqf8ccBQ1yOyJ5iAh9d7Q==
X-Received: by 2002:aca:5dd4:: with SMTP id r203mr4828782oib.67.1568742499482;
        Tue, 17 Sep 2019 10:48:19 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e2sm876135otk.6.2019.09.17.10.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 10:48:18 -0700 (PDT)
Date:   Tue, 17 Sep 2019 12:48:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, ssantosh@kernel.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org, tony@atomide.com,
        s-anna@ti.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCHv5 01/10] dt-bindings: omap: add new binding for PRM
 instances
Message-ID: <20190917174817.GA27938@bogus>
References: <20190912113916.20093-1-t-kristo@ti.com>
 <20190912113916.20093-2-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912113916.20093-2-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 12 Sep 2019 14:39:07 +0300, Tero Kristo wrote:
> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
> of these will act as a power domain controller and potentially as a reset
> provider.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v5: - dropped the clocks property as the dependency towards clocks was
>       removed
>     - changed the name of the node to be power-controller
> 
>  .../devicetree/bindings/arm/omap/prm-inst.txt | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
