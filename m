Return-Path: <linux-omap+bounces-4678-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08344BD9006
	for <lists+linux-omap@lfdr.de>; Tue, 14 Oct 2025 13:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5774218A0AD9
	for <lists+linux-omap@lfdr.de>; Tue, 14 Oct 2025 11:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C44830C366;
	Tue, 14 Oct 2025 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bta5ycB1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C53E30AAD6
	for <linux-omap@vger.kernel.org>; Tue, 14 Oct 2025 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441174; cv=none; b=Tq8tpCDgjfa5xy2yOHd2DZbdNMkFdqwlldoInaHA0dGgkcl7RfD/Gihvu2FHAhv4LmfrAjfb5KEDDVTdseG2bclr1h8qta77Pqs+iDcvyBIInZFpsNq9/Yo2eVIZKht8pyGsgKswVn1FKINughbQsXrECV3CpVwe9R31cJn4R8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441174; c=relaxed/simple;
	bh=AxhzSl8w445Qz2/9QmnikOtBEtA4YSeYe89CVab5wLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fXOj9UWJE0OxO46Uuo/FlHSCIH8OqvpQZZiOn3VQATZtcHoHbIGAI8w58GZtAn2JN5rQ35MOuNr4zH2Nda6gwZwevHEEU+pxLJr7WHLt0McMNyWuoQi+wynNma4zHDo0WKl5/q1abStf3NllixRW5umoqf921OfkfjGEQk7C15A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bta5ycB1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so53076325e9.3
        for <linux-omap@vger.kernel.org>; Tue, 14 Oct 2025 04:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441170; x=1761045970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NkgjM/J9Iy/ZQpNJ94vlbj27WexN53OWj0CXa0A7G+Q=;
        b=bta5ycB1i5svdSaKk/wvRw/YwXazpJL8e7sRG02w5K0mVO+o+DIgR/a2JIoFbhtKuj
         SPS61tSYPLJGhvN1gBoCGyoiGuyiV5MkY/z13UUbYxEusP+Tp35f7OHa3u/uxqTj5TOs
         F2JS9+GcxUvPdtBJ/vN1uW+BoljztnVKxz36w2x9U/ngZ9BW+ipMdp6lsSK7KrnBkqk+
         IwYubRRB64hq+s2yQmDjdJQVz7aMHJKAKOCrQ/oWLqN7ZyZA9jWUBv1pOZ1K659ffKxc
         AzrikcPwd4pLWOM1WkAQjI8pXA0OTuE9T22B5/P53i8e3TRe21KOYJVLTNd+PYekmGUK
         POAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441170; x=1761045970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkgjM/J9Iy/ZQpNJ94vlbj27WexN53OWj0CXa0A7G+Q=;
        b=F71lU6NLqXwsC0jnlD4KheiAVBs7f8NVBg6NzAY37kjO9abzXE33dDuFBWJd48ZgyD
         kxiY5bRpfgkLbQXrCdDscqbqoP1wr5YjRIaFzw+1ODEhhSEdFbUxaVDSFUF49qlTMFIe
         2rrd5a+R5t9koOC13ilwG+MO0iFBka5PPUI2r7onVxTGF+UMS0MHvfKMzrkfTg+Kz0uD
         YHdf8+SxOfOrW69V6dbGOULy4BxXiPp0higcuKPor/ULXbncEmX66aNRYXSLBZXowg8r
         +R8Tn9bSX1ccweIV7joPpnKhyKXqIY3tstej43v8ZthiKXBXS1d4toyNpzYXQAolnkTs
         lCkw==
X-Forwarded-Encrypted: i=1; AJvYcCVW8sP/xgFMtCV/P2bMZBvxoINjlGIjpyWULllSMVVQJ0mnkAcmUVQsibkLs2OL28ht29V84uPFhUgX@vger.kernel.org
X-Gm-Message-State: AOJu0YwBzUQL1y/vjUc6hetNvj3bmlFTlDCvRFvsovyDVpOPDRX5bAYi
	mVj0rXlP0flZUZlZ6ZD0cnYVGWFzlMxw3GlQRz1S31D2Acu69L/ktsTF
X-Gm-Gg: ASbGncsvTD8RAvVtx+4Pavtny7KsvyHUqQ1rBNn6SxhYWQ7WvIzpGOF5yU4jA5JUDmL
	bP+7F6ren+rjIRr0McGYAaJDljcCpYZdcqc8hMloK90HGsbxfhSHq0ZV53O75n8e8jfLU42b+H6
	tS3+5EYKxwiAox0fksBrSyxTMSRu16IWvVZFnL5fGnVQt5n7DjXtXbYVhoareOKoH39s8nIW90l
	pwbz4PZWGMRFXWgj3RaHihDrnAU4n2Xp14/YMUTxpDq5EgaGAbmZ8lZBx+PqmpPAyQ4/9B+37V6
	Mv2b7cYmaTMRvrlrk3XXl7g9A69tTtcs0x0SahHz+coWcXehNKX05MSDDjwJVwpRX0xEX3Kq7ba
	Cc4SnsMVX00HtdT3R7exoW5CYN3pZOp5CMQOm0x6gJyLNqyo0S2wh5auAVe6KLm3pXYSh
X-Google-Smtp-Source: AGHT+IFMf6DIq4h/prpv03d57pehdiVcP3X28cHjsLA6mXHmxzjuKa4nBjbv0JtAImSeizIQEmRacg==
X-Received: by 2002:a05:600c:628e:b0:46e:4cd3:7d6e with SMTP id 5b1f17b1804b1-46fa9aa0b49mr152941585e9.9.1760441170197;
        Tue, 14 Oct 2025 04:26:10 -0700 (PDT)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb492e6ddsm265829845e9.0.2025.10.14.04.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:26:09 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ivitro@gmail.com
Subject: [PATCH v1 0/2] PCI: j721e: Add voltage regulator support
Date: Tue, 14 Oct 2025 12:25:47 +0100
Message-ID: <20251014112553.398845-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Some PCIe endpoints or slots connected to the TI J721E PCIe root complex
may require external voltage regulators to provide 1.5V, 3.3V, or 12V
supplies. These regulators depend on the specific board design — for
example, M.2 or miniPCIe connectors often need 3.3V or 1.5V, while
full-size PCIe slots may also require 12V.

This series adds bindings and driver support for these optional regulators.
When present, the driver enables them automatically using
devm_regulator_get_enable_optional(), ensuring proper cleanup on removal.

Tested on a Toradex Aquila AM69 platform with a Wi-Fi PCIe endpoint
requiring 3.3V.

These changes are based on upstream discussion:
https://lore.kernel.org/linux-pci/20231105092908.3792-1-wsa+renesas@sang-engineering.com/

Vitor Soares (2):
  dt-bindings: PCI: ti,j721e-pci-host: Add optional regulator supplies
  PCI: j721e: Add support for optional regulator supplies

 .../devicetree/bindings/pci/ti,j721e-pci-host.yaml | 14 ++++++++++++++
 drivers/pci/controller/cadence/pci-j721e.c         | 13 +++++++++++++
 2 files changed, 27 insertions(+)

-- 
2.51.0


