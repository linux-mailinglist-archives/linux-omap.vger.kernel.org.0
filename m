Return-Path: <linux-omap+bounces-4765-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A17C08D78
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 09:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 898963ACF03
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 07:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF8D2E62C7;
	Sat, 25 Oct 2025 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAxk4c3I"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F931DE4CA
	for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761378226; cv=none; b=tffE7Ut4PaM8GKNhuRXnCCXdNdirHIXP696Ze4wixV4ZWeQFtWIH/hgw3vZTn+DZ5SkBIOWtE2Z8wSLAvWSkvLd9nfn7T3OA9O25/2bcWBQcdWP+ytEr4AuqQGSLr5IFpMPFSVQX2lfqod6BtpxJmPsQdKKtvHoOHxUWlp7RtoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761378226; c=relaxed/simple;
	bh=xGV1glgkny9Ydr3KIsuzkIRCaEadYHkVr8U90FGPB0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EsNOdEzx02uUaHIRx9PMHdNS1x+HpKaFM/k5hCBLblFoB78zS8MXWnFN2ebnWqdwm2w8RuaySd2OO8ocDNwHVflK2+wcFk0N6UKHIl4ViEao/FINOcOFAF28yzOjPi8IQW5hEorrZuRiF+VNLYxsR/t3rrPcEjPt6Q8f0jpCUl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAxk4c3I; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-781206cce18so2952678b3a.0
        for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761378224; x=1761983024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoVebdxoYndvuY8RSJNbECBWK/xtYB+Fdm+CYMdRAlY=;
        b=kAxk4c3IJ5pt4rvCb68PUT6PF5AkwMLrNi5deE8ouUWucNgRZ9kIe6Q5D8vwpbs7x8
         9F493BqWqoBRACt7s0WDoML8L47FNOE3Pr84I4hx0c7bXJTihMOSIgW08Yt+HsxFGiyU
         oxL5hy72fYpqmAQdw64U1Sg1cm66jz9lvwP7dgetnHnytdrXIgEZ8DlFlXQmyCZOWmp7
         ddhRoQAhTJOwFDvFt1rQtAAalKWGuxG2sc3Qbz4hkPf2IjeRptXdqCQTse6lTMzGzLqf
         pG8BKjaYoR8y03hwo8IwY9eb2ygAHN0I30HYvav4IKimNnxE2fbGkMCYTjIKJONU7aUZ
         tbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761378224; x=1761983024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoVebdxoYndvuY8RSJNbECBWK/xtYB+Fdm+CYMdRAlY=;
        b=UAKmEOsYTZ3+T5uXUBaNw8GSLtiwnzyuz5R+2EtBh4kBsX3Cw6k86an1gh80rZyRWG
         pj8GrxdvclrgHCu3oZ3/WJ05dJxNQ3Tc3YAp+jChK1h7M4623IGsBXb96CfkQnsaJGlv
         OYehyeiroxXaTBl4dHXJmIRS1u9dEApNH9XJ0EMDkf6FoNtkWBSbS7r0eRsz7p7PX1qf
         xZuMg78beOR5XDFcJUG/8dT1AA9aWuULWqGy8wiXzHrKDcA6rmDqCbQWs3BDq9rD6Id7
         kdFnZMpY+J/4loT7FLBfZv7DGMmWqyjn9rdv6UfYfwrUGhYlZDgG2j1yZfsKHx0wcIRn
         Zd0w==
X-Forwarded-Encrypted: i=1; AJvYcCWzEoxZMyKHwZL1EHiQngLr8xEerMw8YmIdgh90B4lYgB48Cc5PO5Bear8zkjdmmlu6FXuw10Fozcet@vger.kernel.org
X-Gm-Message-State: AOJu0YxoQWTj+wzc1YbQJu0/qQtXQWOrVdV4t3AdGImL34zTBEW0gJ2V
	fxC9YmrIxWxRibT91q5SMiJpz4glanl+HucXmaOS4uGvaz4nbHGYx8Wg
X-Gm-Gg: ASbGncv3vVBOewjtr1MV8IuJvbPXk8Jx2Iry/JkM/eGMKPMBXjAvKgX5RAhEax2K+ku
	6g57poqEAG5hWBL5VkCyO6jzW9P36gklBe8CqfGzp1c8M5veTdHjjSFURlwxsWx1vE9CaRo51xh
	KXkqO2XGcM1/qaIc3ay/FGkKlPnzrW/MJ1yMOXIMTgOOlMcQXix5lSpIaOQwEOW34i1fT5rWZKX
	+e146IuPsgOv60vaGNzWFJFrFZOCCYX9TeeExvHag2FSu7BeldaTbKJKRkIpEFnky3zAWXz0BqZ
	SfEz6n4WQNb7XSuZJIWSEccZqMoHFKfMDyyL8fKM7a1oEBmBCy15zkl/djpF9mZajYSxVvoeWuC
	hlXU+Y7oQEsqVuzpsW0mAJzfU4DAULUwmUJ7RXHyh4V+yPZtEsPNXpE8XzMZ8CzFoIFBp2daLCg
	==
X-Google-Smtp-Source: AGHT+IHbg6uahjG69hu0gzcYoFdfbPQ0bsi43jxp57hXpiuURUZytGc4IEe9Wj+GeDsVaOYDgbBBYw==
X-Received: by 2002:a05:6a00:2b94:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-7a284dcfee5mr5115661b3a.10.1761378224061;
        Sat, 25 Oct 2025 00:43:44 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404d760sm1395083b3a.39.2025.10.25.00.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 00:43:43 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 0/2] PCI: j721e: A couple of cleanups
Date: Sat, 25 Oct 2025 13:13:30 +0530
Message-ID: <20251025074336.26743-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the J721e probe function to use devres helpers for resource
management. This replaces manual clock handling with
devm_clk_get_optional_enabled() and assigns the reset GPIO directly
to the struct members, eliminating unnecessary local variables.

These patches have been compile-tested only, as I do not have access
to the hardware for runtime verification.

v1  : https://lore.kernel.org/all/20251014113234.44418-1-linux.amoon@gmail.com/
RFC : https://lore.kernel.org/all/20251013101727.129260-1-linux.amoon@gmail.com/

Changes
v2  Drop the dev_err_probe return patch.
    Fix small issue address issue by Dan and Markus.
v1:
   Add new patch for dev_err_probe return.
   dropped unsesary clk_disable_unprepare as its handle by
   devm_clk_get_optional_enabled.

Thanks
-Anand

Anand Moon (2):
  PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
  PCI: j721e: Use inline reset GPIO assignment and drop local variable

 drivers/pci/controller/cadence/pci-j721e.c | 34 +++++++---------------
 1 file changed, 11 insertions(+), 23 deletions(-)


base-commit: 566771afc7a81e343da9939f0bd848d3622e2501
-- 
2.50.1


