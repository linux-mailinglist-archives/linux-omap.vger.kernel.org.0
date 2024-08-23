Return-Path: <linux-omap+bounces-1974-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC92195CA3B
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 12:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A11A81F26D04
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 10:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0325513AD33;
	Fri, 23 Aug 2024 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wGd7G8Hj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8821474D7
	for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408169; cv=none; b=FzGyyKW/KwP9Sc9IGEvbSYHLPvLxBffmk4aogFMNzZWMAn5VjYNrhijhkor1uc6zOqJ1X/R/BoLXQBlIg/ZpVKt68Xoyh9A2nqhoqI5CGhvkLsb0qd8DJodccZY4Pf4sL5sm+WrMUQ7WEH1N7p6ouraUimrggMmCHZNGnBJxU8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408169; c=relaxed/simple;
	bh=0tzmkbhFR8JRQXWXKdTK6pohoT/BCbElOjUl5Kv60cs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iDtjPLT44xvMkTSDEN/A63XrWh0IHcYaFmQDyUBPqutyY5aQTNvQJURDs08Wabm13pCjpVulj0b93gtM7qLA5yVJcNVcbg9C+lVmTtblxHGS/6c37ziuGw89WNaqKMlf0ntZYalI7xTYoH78xxIK9dS5434RVg7ef++/BvC4jF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wGd7G8Hj; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a86a1abc05eso2276466b.0
        for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 03:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408166; x=1725012966; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7bqePBzINHkvjgTFwk2va+jVYNzWGcHmI5xZozRGo/s=;
        b=wGd7G8Hj+A+ye0j8Sq9LTcZTdxgy36Psw4egBFw97l7lE2GmXmnsyFQipRd+KdAh23
         7bGlv9r0BoBIuncEbrShrU5jAcFIyy3fu4d6KsvUOnLbR5ypGT/b8cDffzwL5XXu0ZdN
         LIdDgmeUPqM30ZJsVfrNwAAKQKduOLb5RQq7mLv2DUGMfPaviMjI+hBR6cBSBLVlW+7U
         9P6WtIZBXB11NLF3jzL5/toAnFf4xs1p05GaLkL1pNUXmtWeeQzDLZ3CTkeP+ij2L2Kd
         fFeXS+xXM++UmQmjeUP4ULIZCg+vKNcT0eIY2PcIayfQADbtCExoV6kyZnd8av0xpdtL
         QEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408166; x=1725012966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bqePBzINHkvjgTFwk2va+jVYNzWGcHmI5xZozRGo/s=;
        b=ad/JyosAwd1W4xtAfCjC3r7e61y95pVr5LNJB1k/Ipctd0+eezmbzIUPQu0EO7kINe
         s2FIQhflAO8MHZEBRru58U2j3Au5JVy+FRQbVP6G4y760vGUsm4vY8yj7TTguMddHOs1
         gqCOy1cXz8kBlouUZJDtjhqXtPrDmXZfjz+5EZzaH6ec3WE5zD3gzboM/fWVAFZgz8W4
         1LwjVyIu2t5RsupayD8YrGNLcjR1MpmRFXuL5p7B+KKfzgGS/PcaZ85RBlAsgc9AqcBm
         zbgLhwfXaDuS0XvpGbiR3H9vc+4oFyCn4SxanY/sBn1hSbAuefS2jHYRIEPJGdOg4gEQ
         7yHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsgvla4zzX97fQl9T/h000LepQPNvWvvosT0HSsjj3BxWos70LgybQWIKtwkwlO88AOrTAXICBJubV@vger.kernel.org
X-Gm-Message-State: AOJu0YxeBYdJzAgMN4V5je1On74BJ1TZgGRYyfOYFzozZRShZDRjkkQO
	Ta+F/qUSLFnIB1dE9ZLcsEbjLeNIlz2YyH16o3Jy6B288JNGbcvtmBZDRK4RONA=
X-Google-Smtp-Source: AGHT+IFKuGSwazbAApYce7kmPQOq+pqZU2d1sZzHUDGWl9Cx1/hXHGmSN6VHvzttOb8uX6G2/zBMjg==
X-Received: by 2002:a17:907:7f2a:b0:a7a:a5ed:43c3 with SMTP id a640c23a62f3a-a86a5189e27mr80745066b.2.1724408165955;
        Fri, 23 Aug 2024 03:16:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a1df5sm237912166b.68.2024.08.23.03.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:16:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] memory: simplify with devm() and guard()
Date: Fri, 23 Aug 2024 12:15:55 +0200
Message-Id: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFthyGYC/x3MQQqAIBBA0avErBuwUSq6SrQwG2sgLJQiCO+et
 HyL/19IHIUTDNULkW9JcoSCpq7AbTasjLIUAykyqieNs0G3sw3XiRuul40LOq2sId+1njSU8Iz
 s5fmn45TzBwbNistkAAAA
To: Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0tzmkbhFR8JRQXWXKdTK6pohoT/BCbElOjUl5Kv60cs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyGFd4JQgSfTmHBBdRsBrgIlFV26H/Z2+R+7S0
 XTMHj48ATGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZshhXQAKCRDBN2bmhouD
 11GiD/49hMAFMfkjvBOAQ1d+FiwSPb/iFVcetp1vGg0zv81FeIi/KnzmJ6av5kfxhXNeJeVUg3f
 1oz28+5YNNMr1o2a5cP/tTzx47p87PIdEPJl1HISDw6QqeUspURXpv/KQZheNaYoSEQpuvxu1QY
 tAyQ2swAq0ZnbwfGsJumVobjUvs6EB5L1nHNjIuQ/O8e/HN3qg1Ss7jlFgYVMf6pO4GZk5QaLbZ
 1B8hrd4GCxmgzgV0ZLSfwtqVAy0Ft1CQHlUrqOxk7TVQYz9fKRsnrrOAyz4mWdBnYYjNtzgDEKa
 3c+gcKJQuuRES25Qul5AODxMIfoRUZSJ8XWqE2TmqEfQ7DsgJFTv/YOi8ecKm21WtqiuOxmyg5X
 4s1kElMJMVs3Y9ffdwNMDvLtyv0y2chf1kPyAPTdc6IUdDS6DeinM3DEtxhCgKEalZcWL2cxJDc
 8AC5TiuVFNsDyRjUYRU+Tef3QpX6dlzBSak6e8VlU7JeK/UCWJtrcm9Cd/ebqbZ4joqP4+v3fwM
 CB/lK4DkU65WFBC44quPW0L6CIWn7UuiY0qjL7QMwAIoG2e8KaIsDraOC2BYBlflj2zWDTcoKtv
 ka8Mm2+1glZLECO56A/EL7EPTwULDi2kkvLAypoaVOhAPcxzBiDBzJuJuPoLMKxNFcqt3InRprZ
 ciGvUs34I4rOb9w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few cleanups/simplifications, of which second patch "memory: emif:
simplify locking with guard()" might have actual impact (RFT).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      memory: emif: drop unused 'irq_state' member
      memory: emif: simplify locking with guard()
      memory: omap-gpmc: simplify locking with guard()
      memory: pl172: simplify with dev_err_probe()
      memory: pl172: simplify with devm_clk_get_enabled()
      memory: pl353-smc: simplify with dev_err_probe()
      memory: pl353-smc: simplify with devm_clk_get_enabled()

 drivers/memory/emif.c      | 18 ++++++++---------
 drivers/memory/omap-gpmc.c | 24 ++++++++++------------
 drivers/memory/pl172.c     | 30 ++++++++--------------------
 drivers/memory/pl353-smc.c | 50 +++++++++-------------------------------------
 4 files changed, 36 insertions(+), 86 deletions(-)
---
base-commit: 0aa21a46c484770ef30207ed77a9fd3f5a6a32cf
change-id: 20240823-b4-cleanup-h-guard-c30a42f76f23

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


