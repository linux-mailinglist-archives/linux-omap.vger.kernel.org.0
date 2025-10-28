Return-Path: <linux-omap+bounces-4802-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE042C15952
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 16:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A06AC50253C
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 15:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3167341648;
	Tue, 28 Oct 2025 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdOMxHPI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BFD340DBB
	for <linux-omap@vger.kernel.org>; Tue, 28 Oct 2025 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666160; cv=none; b=ibQGg8fL/vTL56k538Fg0R62+4JD3y0HroWwufC6qjlCEbek4wY/u/WUReY0mY/GIWA3WKQImSgrf9MixANuZfXUNK7eKrgyyz6VHjafSmpa00dDkiZ6ghA5+I610ibWFTFWRNkVVnBdcwI2peZ73HOVtKWTRIE1QciXe4siCEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666160; c=relaxed/simple;
	bh=+qmujv1j2dhUiejUJ6vkuBSeYgnuFw12qWJH/G+NXcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KcPP9KVANZmsplNovUT0Q1q/tukdjdy/52pbZWubhBltI1leCzwQft2QysCP2ca+OxQ6RByKFwc2V4nMXIYA0LWG/mIG82HgvavITfQYSKghvNeTjpqr0KVkVr3MbuB9cuWiEU6OSuyMPmpxE0jSqho1GMTQXL5YOelawLYnbWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdOMxHPI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-290deb0e643so57047655ad.2
        for <linux-omap@vger.kernel.org>; Tue, 28 Oct 2025 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666157; x=1762270957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4y0EJSogwXb/l2ctLCybder9EWKsVTxzS16PIlLrZdk=;
        b=PdOMxHPIIz/e6kJQiTlpfEr3V5/os9F6YnV7X4b9T6lD/QoPVWEh6Fc8YGVnBK8Vje
         1HIujHTJ74YAZKU/pkVXIMR5CBfxLAyQ9/l19U8Eq8ezH6kWMLO3YNP6ZO+KVEBqUS8N
         ErueFhsGXFk2/B+wUr3KPkVr63iUZH+bKov84O6id7KiJzKyds4cyazK5ugbiN3gQe/f
         pMyr0JaMXO+7gjZKymWxA2eAHspNKc7ZOs2IMSkm78TgH0AKiE6dCEMO3akIQINU4Viy
         vSoZwnWD/PrsIhhjEY7iJgse3cG3hnqqSASG3bEAOnx/ExMS04zIPLQZTtDDnLBaLKCk
         eE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666157; x=1762270957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4y0EJSogwXb/l2ctLCybder9EWKsVTxzS16PIlLrZdk=;
        b=v3A6U1ittDbctONG/2iBnYsRtJvBhMQkD9ZzfVXI3moictnZu9CoKTQUgerc69hfeJ
         eANeBeoDAqrhefqs26hJXIt/tN4ctnDy/PcbxIq10zQRmoQLmwyhBirVx2qWqsX1MmCp
         FBT/8aVgRn+R4vm77/YGEbpWLCIkLyQ0y0DKH1DQtyKsRtzldLqYF3+Mhy1hG9JHK9UE
         vC8QKLl5+zRkVe+bI4c89YkoAd1QfZNhYLoga1ATTCw0k8dunqlhUYanDJgG7lHK1rHC
         rLZZC3Xk4WC6E4PIkGhfcVk833YUuK2Xg9JoLGLRPIwtab8gCyCacBpIpRPH4Y+l/qt/
         qWhw==
X-Forwarded-Encrypted: i=1; AJvYcCVx1lGutbPYFHjtG0aHlKg4Fvz69wlvuLmMgxBqNYXt0U5pXim6GWGsTsNb4EB9K6XugruMTzCHvvkO@vger.kernel.org
X-Gm-Message-State: AOJu0YweI9HUtgZvzJmAhAhvYrkU3x/u4Nd1XveYiMzGtbaMuhDi9aOG
	44jaR304sfe5EWs8JTlPUx2UlbL1gilU45We/Ocw9Oa3oG4tzZhuqm1w
X-Gm-Gg: ASbGncv4lyAqWIK7NGfdizAMMsVhfKQKljrXoJLSKmMnGnNW9a0SMwYye6vcysb/4F5
	uhAWsqANwHBw0xZ4kBFtFSu8UPxa+t12369dX0E4t34QgVl/CGVJ1iD0CVU0FGP3C7zpODIfvnS
	MRo5WsJONa3DoJpVebog2pjc9lWTO9TYJrmOSNNhrCmzRdYbs4qmxUadBxMMMdX32L6vpWy3Gn/
	gPpr6azFBa7H916hCKC3vHfdAWsor45tloPJdg1yUYZbsMsDWJNhdBMP/wm7YQEiFzze3Iux7E8
	ug7UAQHbkH+DqlhWR7hCJEhUMoy2SJbYWN0aMlrZOl2I/t2DFkpkXyB8gNZPKJWL671rGbeNMo0
	HKIn2WhQi0EP18M95sEN9RURBYWo2Nm7m/rauk9014KYl337HExqGEwZRd9W5S77KpaJopQICKQ
	s+6+2bEDs9
X-Google-Smtp-Source: AGHT+IEmbuhAY39zkLzLEiO4/3IEI+wJ/XdixLTlEX12sPPCwzL9L/N235oD3a/xqhHcC17poBLbbQ==
X-Received: by 2002:a17:903:384d:b0:276:76e1:2e87 with SMTP id d9443c01a7336-294cb52558cmr46649865ad.44.1761666157092;
        Tue, 28 Oct 2025 08:42:37 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0a4d9sm119815145ad.37.2025.10.28.08.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:42:36 -0700 (PDT)
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
Subject: [PATCH v3 0/2] PCI: j721e: A couple of cleanups
Date: Tue, 28 Oct 2025 21:12:22 +0530
Message-ID: <20251028154229.6774-1-linux.amoon@gmail.com>
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

v3  : https://lore.kernel.org/all/20251027090310.38999-1-linux.amoon@gmail.com/
v2  : https://lore.kernel.org/all/20251025074336.26743-1-linux.amoon@gmail.com/
v1  : https://lore.kernel.org/all/20251014113234.44418-1-linux.amoon@gmail.com/
RFC : https://lore.kernel.org/all/20251013101727.129260-1-linux.amoon@gmail.com/

Changes
v4  : Improve the commit message.

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

 drivers/pci/controller/cadence/pci-j721e.c | 33 ++++++++--------------
 1 file changed, 11 insertions(+), 22 deletions(-)


base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
-- 
2.50.1


