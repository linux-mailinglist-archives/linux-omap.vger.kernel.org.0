Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC2947D466
	for <lists+linux-omap@lfdr.de>; Wed, 22 Dec 2021 16:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbhLVPxG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Dec 2021 10:53:06 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:42578
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343757AbhLVPxF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Dec 2021 10:53:05 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B7E7E3F32C
        for <linux-omap@vger.kernel.org>; Wed, 22 Dec 2021 15:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640188384;
        bh=wwMXPWMLJyza5v6X1TaAk2XM/noBR4icpHiHaWLn4fY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=LvAWJn/pUyl9AuiGs16ibG+KE1xr+TRhg0Z2JNt/8JLuetw7DV8bcioPfQq6OX/Su
         t9YeJ75An9Ceu1RrOWwxKw4ZftzPd65ChJMe5omFg/jOmRQUjz3goi3FxrVQDy7yQ7
         eaQCt6voPSxeU0d7Zzt+B4iSNo129Xb3X6kuludFtU5Zl03b63t0mT9HTcqWfG2/5m
         Rcs49KmdQPJQIX/KXW9hIOOBaLErJXsKgfXPUjQikFdRzFvCW+CVPKTABuLrOaVPgX
         YqlTRqDm/pboScLzxtyr8I39ZkY8/cwhVc/ibUPfaVLiZxMcsmEzOypjtyevqWhxIG
         8OyWZUuA+84mA==
Received: by mail-lj1-f199.google.com with SMTP id e7-20020a05651c090700b0022d70efe931so361216ljq.10
        for <linux-omap@vger.kernel.org>; Wed, 22 Dec 2021 07:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wwMXPWMLJyza5v6X1TaAk2XM/noBR4icpHiHaWLn4fY=;
        b=0w6LgLYs/b0iCjcMv7foDIUBwGP+WfavlHgok7iXzvpOPxJ1PyuRru6WQ7eFcikL5U
         eYXuH39wdELHANhNzVapQ7X211jQF7rpNncMHC9ESaBxzaS7TN0fFZ7r5GD2K+XT2Jy/
         gv73cBDBFxblIStNxfDRHiep5fjWHbifufffmLT0QS9hwZzohCi7ojXCfR6CrGPQIuMz
         EnwVXPqavbM7M9gOxZRDWOkiKMVkT5Qdu9iI2skxcGqI3PEgI9FrbD+iRpdumCcM2Sov
         /WVYnIJPV5ccs4GTXYP+TCpEd1zr65mLXlErjmsafptdSbLoKfqGsNl9pZqSaOzE9oUX
         M6VQ==
X-Gm-Message-State: AOAM533DLyazYsPxHHEXtTSTDdkl4tTN+lbQgYUKwPbZmIa5GXQ4HLOA
        GC7Qq7I7blkq9XEZaXWkeJZGbnlWOMsae2G4xq63aOmTGWzOkpAa6S3X3u+iO1wjLWSSGcRr7pH
        9EQjAfBM/vKNC0QTKrBsKvhvp7J/zR6BG/V2eIXo=
X-Received: by 2002:a2e:9017:: with SMTP id h23mr2465779ljg.13.1640188382623;
        Wed, 22 Dec 2021 07:53:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXN7uYxkuhPW5AvR4M49wCb95nQJIFBIueJZUYTf3lHmM6d+eH8m+7D55Ok0F5KBXbHsnuvw==
X-Received: by 2002:a2e:9017:: with SMTP id h23mr2465760ljg.13.1640188382372;
        Wed, 22 Dec 2021 07:53:02 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u4sm250738lff.17.2021.12.22.07.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 07:53:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     tony@atomide.com, miquel.raynal@bootlin.com,
        Roger Quadros <rogerq@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-mtd@lists.infradead.org, robh@kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        nm@ti.com, vigneshr@ti.com, kishon@ti.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/4] memory: omap-gpmc: Add AM64 SoC support
Date:   Wed, 22 Dec 2021 16:52:59 +0100
Message-Id: <164018828306.17046.6793512518826929956.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211221131757.2030-1-rogerq@kernel.org>
References: <20211221131757.2030-1-rogerq@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 21 Dec 2021 15:17:53 +0200, Roger Quadros wrote:
> TI's AM64 SoC contains one GPMC module. Add driver support for it.
> 
> cheers,
> -roger
> 
> Changelog:
> v4
> - move compatible match table to header file so it can be used by
> GPMC driver even when NAND driver is not enabled or as a module.
> GPMC driver is always enabled as built-in.
> - Select OMAP_GPMC driver from MTD_NAND_OMAP2 driver config as
> OMAP_GPMC is not essential for ARCH_K3 boot.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: memory-controllers: ti,gpmc: Add compatible for AM64
      commit: 4892242784786f3cbaa3b79ea03f8b0c145f6cfd
[2/4] memory: omap-gpmc: Add support for GPMC on AM64 SoC
      commit: 7e58accf4547b75070e5cc1e04f97e890d7f719a
[3/4] memory: omap-gpmc: Use a compatible match table when checking for NAND controller
      commit: f2f8115fe8b390af27d013411045bd712a812103
[4/4] mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3
      commit: 5784260892e5b808e1317843f71d4b787ad1f4b7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
