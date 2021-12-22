Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7737C47D0DF
	for <lists+linux-omap@lfdr.de>; Wed, 22 Dec 2021 12:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244599AbhLVLTK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Dec 2021 06:19:10 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36176
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244595AbhLVLTJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Dec 2021 06:19:09 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9C95E3FFE9
        for <linux-omap@vger.kernel.org>; Wed, 22 Dec 2021 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640171943;
        bh=gRto3bMwRqm6uYRI49pN2BzwP2iT8FJmfFUdCfTUZnQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=pzYlnJF5fBaQrS3AwPdw4zt4EOx0aCglff6O1rCkLk6YDEQFRPwCRDiLbK3HzHnbx
         +2+pElXMAwHx7/c3Z6AEzoF3UbOGMWKehgY9PcMHp/3VrYR09OopcnkSih6+bi8Onc
         F2xje3NGkkOTNW1+QKRxm6PPO4Pdp+b0UzY8Yda6SG4AmvPCmKfzf8B9Vkt/8Xp/hj
         L9LvodjbY9shbry0SyQ/I2/cb/bsTKQsZO70i3rNfsYzotYWgTOqmhaYz5D3Sn3Ygc
         +oywljSxLAaLp8SzG9hfCMBHUl+2h+TsopkCvffUqapH31t71Fqr3wGk10AfTsjiN/
         2IiAcBTweHr8w==
Received: by mail-lf1-f69.google.com with SMTP id k25-20020a056512331900b004259a8d8090so1082376lfe.12
        for <linux-omap@vger.kernel.org>; Wed, 22 Dec 2021 03:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gRto3bMwRqm6uYRI49pN2BzwP2iT8FJmfFUdCfTUZnQ=;
        b=miotGaBpyJHMVvP2figzn8qZ/D+4NjuqE/eLKFly5wEk3dMl4CMSjxMLo+u5Mf+4Qh
         o7D/RBltPxAdH56gmXVlD9+QcuSt0uRffdtRuijxufubFVNclPAN7Ut3tg9tlrhVd7GU
         wp2gCrs28HkBZ/CAUcqmT6+iFg3du5tx5Cp0A/5mwbBjiwbRehfq7fVMc7Gj0iQ+XzCR
         8qbWRc2Gy0sAqXRGaor2+drm3yWQ0IY/DPBgTfYli7zvsbHj51j7OFYpu1Ivvweg6MKD
         UXEPsZJaDdGm2i7h0gP73TDAuYQhs1Lsm8PHUhkDtG6KCwfdWh56OdRMEa1ZBOM+pIvb
         LNZg==
X-Gm-Message-State: AOAM5320k1RFPYeRel/VMp+dRxtJcsnVDwl4CfZJ483nDrYaBFp+Egfh
        v50yNo3K+r87NskSe6Jbfu4zECA5Ox0wctiPSkWhgV+TzaCtQ/T+Lme9QVZimMuIjsXN0xdjBPZ
        8M45danZPr+W8uenNM/+0gtUAsr1f+k7fSyczhHY=
X-Received: by 2002:a05:6512:139e:: with SMTP id p30mr2194879lfa.492.1640171942904;
        Wed, 22 Dec 2021 03:19:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhg2Bn9MX4WVBthED432ggeHj92R+QHM5gFVoD7NyWRBX9XUE/hWjuopOXds2i/FkXGUj7ew==
X-Received: by 2002:a05:6512:139e:: with SMTP id p30mr2194864lfa.492.1640171942726;
        Wed, 22 Dec 2021 03:19:02 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id br34sm182068lfb.305.2021.12.22.03.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:19:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-omap@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: (subset) [PATCH 1/2] memory: omap-gpmc: Use platform_get_irq() to get the interrupt
Date:   Wed, 22 Dec 2021 12:19:00 +0100
Message-Id: <164017193162.7358.13024794236256951506.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211221203916.18588-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211221203916.18588-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211221203916.18588-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 21 Dec 2021 20:39:15 +0000, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> [...]

Applied, thanks!

[1/2] memory: omap-gpmc: Use platform_get_irq() to get the interrupt
      commit: b1ae2e3748142e7324911029703173f464a83522

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
