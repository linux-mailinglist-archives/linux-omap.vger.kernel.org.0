Return-Path: <linux-omap+bounces-2748-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD139E0565
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 15:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1593928889E
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 14:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8099221C16C;
	Mon,  2 Dec 2024 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="NJ5e1wOu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B32194B7
	for <linux-omap@vger.kernel.org>; Mon,  2 Dec 2024 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150021; cv=none; b=QG0y8y7tABqCzA4epvZTn0DQAb0pmwiIURfZ5U75SZviF9yL0gaVTTSkVeMgHOC4GvrPDbGfnhvfNqU143vqgYTy4s/LHoecjHNDJ2HqDrKbCVRbvSVGWQHuZAUt6weg0/1DxSu2a78h1lMBxQo7Rqh5/WShNzA1ON1TqD0QUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150021; c=relaxed/simple;
	bh=BaGHpzbQnGS9h9+GmmvEjlZrAsuM0BYLJeHZ7pkhhK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TZLltvnaDPVC/cjDKAW4BAMsK+fbr9FTDK8iFeem3J4D2UphVjYeCscqbOqIZ3O2q3zM5se0cz+XqA5DmSDvp01BDJr2+H0FNp+rpKxC9LTZYYenXDJMbky4HvBpU31U+G0vPdmf/KvcFVjCXxtn9CVVWwsp6P7S2j4B8xHNqtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=NJ5e1wOu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso39897105e9.2
        for <linux-omap@vger.kernel.org>; Mon, 02 Dec 2024 06:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733150016; x=1733754816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MO7RndIL4M9BqBFNQs9/VUiPinRWNZHXUCcV/Hhz6kY=;
        b=NJ5e1wOui/G55zH8hsIDORqpWqMbVufaEry+obnX+0qt5vpA2jD18laX/l9P0te0ca
         DBWMBTcJT2U+FaYLXoKg0zj7tTm1um7obw0KqNz5GLDFoZvCi6UjS2iOSPiGIiPVI1Kc
         /eNN76oqjk9+alqY6nNCTERxJ5RddKu7p0Duo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150016; x=1733754816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MO7RndIL4M9BqBFNQs9/VUiPinRWNZHXUCcV/Hhz6kY=;
        b=QGPwligxBQuAMGDdLRmuMGYrHLjM6hi0Swviewdge2Bp86zvc+BX5IVmEZlHS5Fur4
         dpJKXodVGymwe8UurK4tOL3BJlDrpvyXX0ByU0RMKWOO6wmb5SpI6wRiGjEmq/4Nxrz0
         GsgZ1RLXYLfZj5upUerdnds7P144OHTMSVBCLj+Te/wkz1wNABKgnhV8qXWQsMUaCXwT
         InFUfRZlkBtBP1dyZ920splU3AnFHtSaN3UJCV17P9E7e2S9uMuhxwjTEQV+2p3X0SPa
         vGPMDpLLU2LOHg3F7IRD0gag701nYt3bIQxLijIdEoUYJrAWkcWppPLgzfH1/MVz9Ttg
         8ZXA==
X-Forwarded-Encrypted: i=1; AJvYcCXjeV1Lf2+BGSS/yiRbqx9AsZbEx50iYPGUyIoTvoSrIx+8aFwR4lSpzpFzl1ldbN1DOo1eBYCyevnM@vger.kernel.org
X-Gm-Message-State: AOJu0YyUhdpdLzj7lUCiaqmGp5K5mNUmLzHLI+16U4Hzh4Zos8A1mJjw
	+/owy5Y7YC+ipaMTaGPdlAqCy0VTEG7uli6vvjJLdC0kz1JuW/Gjdhyni5zhDGw=
X-Gm-Gg: ASbGncsLOc8T85mQZhbmUxQksNJrQzzeQKnzV0XWmsBk4ShO424sTjEmlsGXWK3nH2I
	OjZ4endIhQyGEqEFXgKrPq7MKgsjoO1/1/95Kp0UFMhuUJG+ocw35wWA9Da4vcpWv+cC9aMV976
	rFzsawDoEi3XvDmqL/2ee4/M9tz+ZLe/yj4nBtxEZxOhTb1oA9JSUO/fnAre5c8Ct17LnonkOYX
	3HFRy1WWD2e14Ti5pK4Gmw6tpB7M+Dm43wnzADDyxQeJBqiL/oNA3dCywu3SVAs0AmeeFEUASJX
	jVoc8KLJocG+sZwzkJPdbDUddqrzAhwZ67Veezkv2ZLBCcA=
X-Google-Smtp-Source: AGHT+IFnRH0g2zecuvkeg70vcEHwDBSX16i2HnGbj1QA8WdxkOgfJwLhEB0xy8ebIOY3bQXUoeRFnA==
X-Received: by 2002:a5d:5f81:0:b0:385:e9ba:acda with SMTP id ffacd0b85a97d-385e9baaeeamr5801500f8f.2.1733150016329;
        Mon, 02 Dec 2024 06:33:36 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eed2510esm4312569f8f.69.2024.12.02.06.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:33:36 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
Date: Mon,  2 Dec 2024 15:33:30 +0100
Message-ID: <20241202143331.126800-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
SoC are used to drive the reference clock to the PCIe Endpoint device via
the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
obtain the regmap for the ACSPCIE_CTRL register within the System
Controller device-tree node in order to enable the PAD IO Buffers.

The Technical Reference Manual for J721e SoC with details of the
ASCPCIE_CTRL registers is available at:
https://www.ti.com/lit/zip/spruil1

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index b414de4fa779..032cdd30d95f 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -115,6 +115,7 @@ select:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
-- 
2.45.0


