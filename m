Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3CA345A018
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 11:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhKWK3V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 05:29:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:45278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229847AbhKWK3V (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Nov 2021 05:29:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C73FE60ED4;
        Tue, 23 Nov 2021 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637663173;
        bh=JbwEOHKUxn/pb5uIuV6jwaYtPfnercK1eHpRy9eRb9I=;
        h=From:To:Cc:Subject:Date:From;
        b=Idc6IvchMbBSs/jjo+A8yITIA/f3siQGg8JeK/IMDdUZq135HTCq3pg6ez9GOPE8N
         gcWHTC1vlIROkGAO9ezuUMX2EMykI+rqM6N1YH1C2O9Q7XrPHo/ZAv0uCAOFCdJS3d
         CT/Iq7S8GrRAU582Xk+7LvTEQa7ky8HFpqpXXDwMyz2KRRKrRYUH+L819WsUHorXYB
         sNENjlnP8jE2nFlT/yNH5QgXEANbSxPUK/jmtAM0PmbPg8xkq8L1TsaYf8WDXGcwjg
         GubAcBpupEoXLH6n+A9rPnMMwuXbvvVIyaB5QSRz+EysKTYIjQnJbkXQ3Zju+JcKEy
         h9NYYe/nqoPCA==
From:   Roger Quadros <rogerq@kernel.org>
To:     krzysztof.kozlowski@canonical.com, tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 0/4] memory: omap-gpmc: Add AM64 SoC support
Date:   Tue, 23 Nov 2021 12:26:01 +0200
Message-Id: <20211123102607.13002-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

TI's AM64 SoC contains one GPMC module. Add driver support for it.

cheers,
-roger

Roger Quadros (4):
  dt-bindings: memory-controllers: ti,gpmc: Add compatible for AM64
  memory: omap-gpmc: Fix menuconfig visibility
  memory: omap-gpmc: Add support for GPMC on AM64 SoC
  memory: omap-gpmc: check for nand node name instead of just
    compatibility

 .../bindings/memory-controllers/ti,gpmc.yaml  | 12 +++++-
 drivers/memory/Kconfig                        |  4 +-
 drivers/memory/omap-gpmc.c                    | 43 ++++++++++++++-----
 3 files changed, 45 insertions(+), 14 deletions(-)

-- 
2.17.1

