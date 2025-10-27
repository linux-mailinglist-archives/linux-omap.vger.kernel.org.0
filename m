Return-Path: <linux-omap+bounces-4782-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ACDC0C918
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 10:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A51A4F6E47
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 09:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA8F258EDB;
	Mon, 27 Oct 2025 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzNWtaWR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E342A220694
	for <linux-omap@vger.kernel.org>; Mon, 27 Oct 2025 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761555800; cv=none; b=p4OWi8znIfp2kNOPlHcnpTGiunPObdTAjGGDKmckWE8jmrfjarWzB3GKXT8Z+v58uq2R10oqkdVUUSNmwlB1pUlKj3nozSrUwTvuGR0Z7HeWvoQBpqT+UcJT3Cn+Eyo5FPIWqRePLp5bUxO4O3XGwf5nU+RxlkOoaTraz5NDc3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761555800; c=relaxed/simple;
	bh=39JSbHmlk2Zr3lfvER7UAMC1eMXf7kaYCS5xIFrjxks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RbRIdXWlGVu/SNiCq0n0KfmlodzPudbM4X7Yhvn/I4xD5oQbMQnynANXWk6toi62yZq+5nYDDvvqZ06nohxH0felGxolf3ieoHYKsO8z5qJJZlYXpEGvn5LxYWhh0kHWsaYh4k4TLxU++9gR6E6OOlFEp7TjCLX/1KGc/Cdus9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzNWtaWR; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a27bf4fbcbso3522732b3a.1
        for <linux-omap@vger.kernel.org>; Mon, 27 Oct 2025 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761555798; x=1762160598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G2Xvuh0I/opmY/ziCGQafTK7nM7PxgpGRf3XOAE2Yhw=;
        b=ZzNWtaWRYmLgwI9k3YBLb+T1N9jJdjYIVjdts5PR7spwERLViiQHh4NkjoGOEQMdsc
         zSL4EoO0CB+Nysc7i7sPhJ6iaj4vUtyvgFTD+xEiYxUAuRnlEC4tU+pCmVU8UwwX7mYD
         sk4B+eSjiZPoC5/UHbiJQienmXvZIDXThBv2TdDBBxFnU19OWM+WhKnAJby/T7AbMG8a
         FDdq1oPMfP+pT6jb5PiLF/+pzTUK4HM+99BZhYtUFCHgXePuU+TDb8byyKvO+2FCch7w
         6ck/QzLriJeCEx/7menunNc/DBqfobox3lYU7i6nnOumer7Ed3WZQMvInKWNKMI++ruT
         xFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761555798; x=1762160598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2Xvuh0I/opmY/ziCGQafTK7nM7PxgpGRf3XOAE2Yhw=;
        b=IV/ElMVEPF8XJoMJlI+rPw9Ld9s2Adw9LRy4awXF6QLmsjrdbBdaE2wzdoOWlFip8g
         qYjt+4l41UGp2dhCAuvZPd6KcKiDlQJARpwUMH8kW+pTjW4v27x+wX/D1EOTsoKD1AER
         23DDDNbvPZ1UV5ag4kEv80coy0W6b60Cquxuw7PIgXBLpH/5pFAVXaz0Uj+Zb1ldVMUm
         mbj68tnG+yfj5mOnVRJjSON1MW1whIASZVl8WgVVuRkyHE44c2jOcAE5jyt7IQAZyb/R
         vSDn9ydG1Ll3BFPBuEtExIXzzZqbH7vPiDgE0ecwb1vk/Fzvy+BRv24Hz23ArF1LWsJz
         jwXw==
X-Forwarded-Encrypted: i=1; AJvYcCUtvqTYflT6ERwZz/Mlf9rloOCrW1/neIruhOEOjDbHkVLEt83eA6zN3urb6roI1UuJLdzcAxnSltEl@vger.kernel.org
X-Gm-Message-State: AOJu0YzR1UxlJSShIIlXYUDFoGtTWJEYa5+qxskGNMOExdkjd5w+0hLB
	fKEIElSme8reY3e5zM3RabMD2ritLpucAekflqLR9Ms8/+ye5Q3x1sVR
X-Gm-Gg: ASbGnctSvxd7ft0ZCLRDWIHObjisa6+X4t5iZBuPy7Y2IBgztXmcTvNyf2r4ijj+13c
	E7H2kquN/nwjhpfS9MH0X/ioolw+Uhssfj1VhyxZi3FJr/aVedoqIqcZr8wYGCo9w5BHfYJSnxO
	M1JG+6PB6rJe2FGVZlB3hsSHRuVSArBpwNzyJmlniiLKgzVYY1sWuwzFJ7JgFCht7CfZ8y4Rvq1
	vl0/t6palBv7fOgIxQFKufip3Cl6P0c84mFGX1k0maYbDzNa2qloF3MiU5iDUSxctjZECCflo5a
	7MSCdlr29IsAaDVE6luWcNrH/mWiOu0/6yX7SaB4O2OJ93cW+DIgo3srCW9G4Z+sG5iVwO1HCSy
	WjNxs22/FH6UOGV1n0MI/FNdHDzHkq52JEA3+aEfbkwNgyi84uYdN/gbHU8npy2Fn7vTCBSpBjI
	5HLGbogLLT
X-Google-Smtp-Source: AGHT+IGxRWBU+fTBAW0RgqmP8oSsQAfOzUEn3iCBlYhHwERcOsccVd8fAGBDoZpy6feb1Z5JjqF9+g==
X-Received: by 2002:a17:902:e5c2:b0:26d:72f8:8d0a with SMTP id d9443c01a7336-290c9c8c7c2mr441668685ad.12.1761555798089;
        Mon, 27 Oct 2025 02:03:18 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3433sm73881335ad.21.2025.10.27.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:03:17 -0700 (PDT)
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
Date: Mon, 27 Oct 2025 14:33:04 +0530
Message-ID: <20251027090310.38999-1-linux.amoon@gmail.com>
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

v2  : https://lore.kernel.org/all/20251025074336.26743-1-linux.amoon@gmail.com/
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

*** BLURB HERE ***

Anand Moon (2):
  PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
  PCI: j721e: Use inline reset GPIO assignment and drop local variable

 drivers/pci/controller/cadence/pci-j721e.c | 33 ++++++++--------------
 1 file changed, 11 insertions(+), 22 deletions(-)


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
2.50.1


