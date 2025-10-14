Return-Path: <linux-omap+bounces-4680-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6021BD90C9
	for <lists+linux-omap@lfdr.de>; Tue, 14 Oct 2025 13:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 627493AA96D
	for <lists+linux-omap@lfdr.de>; Tue, 14 Oct 2025 11:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDF830E0DB;
	Tue, 14 Oct 2025 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLDNKlCe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E1230C625
	for <linux-omap@vger.kernel.org>; Tue, 14 Oct 2025 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441565; cv=none; b=k3tm+Cu/HCQRyx71tnMrBUOeQFUzJUyNCRjXlrM/FGpYiNNQw5j72sf4ljqdXW3A7ACFQjDRaZqKfyNAu7U+Pinp8jld23GzULXmmDfh/s2tYi1Gm2WJGSaAnVIDNXxO3mte7Oipy8Igd3H9vMztXHmgvEe6KhDNIf4VC20baJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441565; c=relaxed/simple;
	bh=ger5yta4kuizbC1oqevE5vf2viR2j52bwfv7+Byb+Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lu+wLGJnIC1ZbbpPFAZ7g3YGQGU/SaG0lPXcFXkNeCO2W79aDfx9cdFp2HWuLEqHvTpuDFRQ76wBJ2xa96GhSziuxMXrc4rPPjIeV0k7fiqVs9f3SgWSHwUfY0GXMxbnrS1BkPB1vjFzg5/x/zwiZZw7uOGkF4rorYrtMId7GrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLDNKlCe; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so5595995a91.0
        for <linux-omap@vger.kernel.org>; Tue, 14 Oct 2025 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441562; x=1761046362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0C3j15Yugc04L5diekbYBCyapTdq2v/4isDBpQOj5g=;
        b=aLDNKlCeNGAS0D91pz8FuQxsI3DaNq2eRK9akzUk7JQWO646OcyogTCG2wUhrItO6Z
         0vnuupyLJlb3z3aFRbLtdCtxOqbxBybcF8SOUv73dUJFhhIy59KyiggAxL0p9+Cy6G8w
         TjiDu2JJc0ZFdyGgw6lrSN2tJtPQ3FPEVWYT3A7/sneUdxP12fw8bFBRcp5ZnMeeg0nw
         KS1jnkAPznWsHfeftoy1yPvmlT1y1mQxXxx5GZgu5Fr1cawVaaTC6W5V/Au9IoEscjAn
         kBasgYL0VJo45avGcN4V5hlM6wrhFtXKTVWHC5F/57TI009C6cjjo1Z8dZO2DjSHV+e1
         QLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441562; x=1761046362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0C3j15Yugc04L5diekbYBCyapTdq2v/4isDBpQOj5g=;
        b=mp84XAzH32MgxR3Sqp9fU9o7Gy93Ad1Jzcb5+FWYzXQByeIiTsQz+ozRgSm61e+JGX
         2QnEIw99aRqlSR6EBGVarm34xPyylHJ3FDpGOb+EgCVJJnx1I6/wAEe2uzTZ8Le1PAGd
         7CaI2ohj6lSL5zJApqD+o0/Kwo/uyu+T/9UG+010Ybgb4YSxvzGKIM0BvW1b9AgoiF8m
         Gfh6ri6NTomjpFswJsCPN9cKZQjH2UDvMz2ivbzVQAndYm63rNLWNIg2cmB6hEI1FqKa
         4EJpAKGgXjo26Cv/ijoJM40+eT+XtbiBMVtI+SRObSFTqRbwryPHooF3MnnWPAvdGG6P
         SF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlsVF0djWaByflDhi0GIBifozng4ggwYpmifXe+LHf03+qTX9rj5soSuZQIvUgevpIjryPFGOhxRyn@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfb4AKXpKXjIhOTtD9X819NIuhFTLzZKsR1myp6lwanYHpTTHy
	WoLmzX2ITYW63uet6C/WpTu0pZKwHznhw40S7fpZphPkpsuTvnmUyxpz
X-Gm-Gg: ASbGncshygmEHeFsMWus7gJqetxZJIQbXJcTFyji78UQ6EHA5PKP+EmxSso7b6IEQYW
	fLmq9bWyXx1nGutt1sKsxmOE3yUGIRO5ClsPBhjZnS3nzvZVgnYddk6uHPFwUzjaWodhgGFqOWG
	XLCgTpBGUGTvCkz00uyELsKQB/nYI+4ArQbBHGK3d6qQ/9Fzta40+DgEHzGE8Tgd6NBIbztWfGs
	E850xO7GTzutATTlUYQW1eBYYn2rg1Hl2tGVKX+GjhPD1fr1XI8GOBPdZnEeIue7ZTAnvsWqBPT
	66pDAabcVP3yeYTyPP/H+IEyb+KVXWT9bBIioFBYiTTjpddeDMBLyoNfDZeu2oUGxQOLYdZl3Q9
	z4PvmKbkl1An1PPeTQ+vP8KzkF4+pxUsSPGBIw6Y=
X-Google-Smtp-Source: AGHT+IFOXw7annfzhh83UINHXYFo00qKcPjKDkiEC3wElyWcHBIp7o3ZfuqFZw3zUefrPIrk44z91w==
X-Received: by 2002:a17:90b:1652:b0:32d:d4fa:4c3 with SMTP id 98e67ed59e1d1-33b513cd9damr31858712a91.31.1760441562336;
        Tue, 14 Oct 2025 04:32:42 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0965c3sm14871383b3a.52.2025.10.14.04.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:32:41 -0700 (PDT)
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
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 0/3] PCI: j721e: A couple of cleanups
Date: Tue, 14 Oct 2025 17:02:26 +0530
Message-ID: <20251014113234.44418-1-linux.amoon@gmail.com>
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

Changes
   Add new patch for dev_err_probe return.
   dropped unsesary clk_disable_unprepare as its handle by
   devm_clk_get_optional_enabled.
    
RFC v1: https://lore.kernel.org/all/20251013101727.129260-1-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (3):
  PCI: j721e: Propagate dev_err_probe return value
  PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
  PCI: j721e: Use inline reset GPIO assignment and drop local variable

 drivers/pci/controller/cadence/pci-j721e.c | 39 ++++++++--------------
 1 file changed, 14 insertions(+), 25 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.50.1


