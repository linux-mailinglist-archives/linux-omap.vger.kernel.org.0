Return-Path: <linux-omap+bounces-4666-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65457BD282E
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 12:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FE3A3B2EF9
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 10:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D943E2FE07F;
	Mon, 13 Oct 2025 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="if062vR2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C461F4703
	for <linux-omap@vger.kernel.org>; Mon, 13 Oct 2025 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350658; cv=none; b=fVznwTImtadghWB1HMeagBRoLG6i+/SqECGTx3HdA7TIoTXdvlHt7+rZzDVMekeItvhrf0nrnuAWIWjtniz27/OzlYCjTvdvlLEfxU4rfPYMQaMQ1UTVhcNTZ9hVepa6E6EzYTsGneyLcpDK0Fj2sE0IHDaY8FCFTC1/Qlydz5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350658; c=relaxed/simple;
	bh=77NJvqQF1nAsnv1nanH3kBlJOQ9BOGCPO1Kjf8/3P4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MTcyrAENVU9+o3fi6R0JIIeRPDXLhrqYZ8WyHgYDkjKEK4Lu1NUhUD6El2ZURdefBYeE7fOYJY6rGpPgg702xlaKGlar+1Kk0BI1remEQC15iFSOQjUDreMvMiPZalIe81vhd04Hmv6qucjWZSLL5oqL/QY8IkktPvpNgJIpZxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=if062vR2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-330b0bb4507so3537419a91.3
        for <linux-omap@vger.kernel.org>; Mon, 13 Oct 2025 03:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760350656; x=1760955456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wki4wD46J9sHWa2HWv+VTuD7xLgHt9zo+ivAkfQcV1Y=;
        b=if062vR2jPjECQvZWkd/vTCMEEIA9uppVwrnC1o/+cXtsmfd08UBdUn3K/oog3ctIO
         TVlqbEqiBlv/y7xKjnBz5NYgpZ09cPFT8/Z97wFWpdNrT290iX0MmLUyGsByK7029ZG8
         aGna1W020AJMJoEnWNRDiuUqbYcHFGVePhas/HHslzknt2jJO/9Ahr+8mlZoS8IMgQZq
         33cJd1IC+kcpeDatVwBs1iUkORsyFdtx5K9bU92DrSC4SHkQBWTGLlyU2RA3AdpwvsKQ
         a6PCj2aCzXLaZPzzUvLr3GjguXbxG8ffgoZ936KQ7+IO7yAY7jB7plILfOB1DhhtV3Gt
         9sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350656; x=1760955456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wki4wD46J9sHWa2HWv+VTuD7xLgHt9zo+ivAkfQcV1Y=;
        b=xGASMOcQAGsx86PBSgOht14XHzd1SxedzNNJp390wLxH92Ik5ajjUhdvCzdArVIOT0
         7GMAb4jZjogswzW+FIepbVl/3JN5XDBU+mNHlceXZ82kkkxAjdiiKzxm2HkehDalVHeO
         2Vf+GiraObb3ezH0Ufml4qREogOnw24CIldLld/90NHGfYDADeqRlCJlTCW9YEmgNA2w
         Q/2ucTRIw8Yr3850cDXgQ4OYZsLJxsWGmulsjvGQxlb0XLDr5rnK11KZ6XiD/scFXcQg
         O+Ro4aF+U9F7hqDaov8jTGth9WR01URgdtuCI4Rtu9tkCK3pyXratiKj/R4B3RyHTIZ0
         Y/ow==
X-Forwarded-Encrypted: i=1; AJvYcCVXar1cF6He+1uRiKlMB7w3ByPKasgr48zreNq/JSlsYSq7WLobNFWPoBcGG6Ovkq+a1ACHfZ2w/oh5@vger.kernel.org
X-Gm-Message-State: AOJu0YzvZD3BGACzkF1vO76VH5QsxmcgzyLLe4FyCZQbw9li6tO44JNx
	z7uU5KeIpk7fOcuygwk59EchHF12zcKm7YCjD4FKznzt9zKMOsiPzt+6
X-Gm-Gg: ASbGnctxYOBFcEZs4EC0mHWgX0+ohUD47xwbpAzus1Ck85Eug/iT0zPVyWVn6RQ+2q+
	LTVxaC/fqaumU6EmaTqQ8q8bEAAdkVNSiWKXfoxRU1q8C8GkHgW3nohGN+h6I8iTm33J1UmVnEn
	w9UeF/UDYAGG7U/6BcrMx2RBx7x3FijrygrO7G5RCd+lfK3MtMXzAG+Owf2SnifGVbUw8PrzK0I
	QW7m5y93LcP4/gi0eE0bBckyQs/ufuObqhWfyDXhuw4JR3b9UiDm/La08BBO/L6viqPy7PpqBZW
	1Netzv+ASNB/jabGvlAQUzIWu08KZ072A0MRKeA3fGNjgxWGULWvBS7AQ/0GO7FIHae8m9cgasb
	JrM4MZzdf5nkF2JiNy4ZDTzMGENkIo+nK5d0KnX66nbq3ePOZqQ==
X-Google-Smtp-Source: AGHT+IFWUyq6JEcHtp3am/7eUBgtvhj0qj3bSnmWO1N5QwdAIzZeISWAhKZhiB/dnKtHDfPJBcdWEQ==
X-Received: by 2002:a17:90b:38d2:b0:335:2eee:19dc with SMTP id 98e67ed59e1d1-33b5138401amr28464765a91.28.1760350656488;
        Mon, 13 Oct 2025 03:17:36 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52a5656dsm7422864a91.11.2025.10.13.03.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:17:35 -0700 (PDT)
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
Subject: [RFC v1 0/2] PCI: j721e: A couple of cleanups
Date: Mon, 13 Oct 2025 15:47:22 +0530
Message-ID: <20251013101727.129260-1-linux.amoon@gmail.com>
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

Thanks
-Anand

Anand Moon (2):
  PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
  PCI: j721e: Use inline reset GPIO assignment and drop local variable

 drivers/pci/controller/cadence/pci-j721e.c | 25 +++++++---------------
 1 file changed, 8 insertions(+), 17 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.50.1


