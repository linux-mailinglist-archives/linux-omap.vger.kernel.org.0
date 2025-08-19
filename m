Return-Path: <linux-omap+bounces-4269-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F24B2CD99
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 22:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEF445E5701
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 20:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C59F3101DA;
	Tue, 19 Aug 2025 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKcN2giu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3066426A0AD;
	Tue, 19 Aug 2025 20:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755634401; cv=none; b=NC7CkppNs1LkOycNkwDlUITmc3sIS0kbUwHkefFHizvKeAyjWL3hWWX/iNtLy6A/157Pxav2nUCeTZd98Hov8HngNysk8/Gdz5iDy3l+zO/n0dsnJzwhH/z6yah/wBkzL4ds4PDzUjiRoiB3g1iRP3ljmKQGQbA9CaArz65kGT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755634401; c=relaxed/simple;
	bh=9X/2VGNApmcQ7rOcJ+VUgDeSKoF3XoYcobAsc+OKa3M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OfXISz5s/TGIAVXTOwGq/PLc+2J4HoUtcZaAUcu6i0AOwoenwyMUPwVLWMQy1FnUrCYPL925avR8k1HVtwO2fYaTXowbIIVg6mNSWEnQmJSdIyGI4T6+5fgE3M1mJRf8MlruG31dYh8bcmqch6qOZS3uZ1dhqGIsBa0Wybtj6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKcN2giu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9e41669d6so4366115f8f.2;
        Tue, 19 Aug 2025 13:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755634398; x=1756239198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hv4875C2PzimpafByJlP6Vqr30Mci0sbeGJ0/jFTW9U=;
        b=CKcN2giuhGRIKqi5TSNs4bD/UYxJQXZqTaQzK9MJdimrT2rY9prJa2ZnzNfmOZ/e+c
         nKHiqPuaOntvcsVoYjfI78yNvsxMhwPSzmOaUDDZXQzrYXbsPnF8ivGBkMvRvBwSd5UW
         0skZYv4vE+VKSDmk2mpJTp9pzdA6XzZbKi+OXgBV3Td9lkA3oPJfYXk+bpj/bBGENX0X
         EXdkHBsaDTqlELS5DQrTglcLpDTT11FNJfmLMsXokzMq12+TZVKQA9d9TMlzIJDxU5bz
         ufEIZ9mGK0mrAKxEqoeKZ1WQkOZ02TXeyPlnIz0+gtf05QuPy8BbTtQZ1isHZDgcZjEB
         rI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634398; x=1756239198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hv4875C2PzimpafByJlP6Vqr30Mci0sbeGJ0/jFTW9U=;
        b=Mhep7upHIoMTmsbzudMe6sSvbYD+ht2oo0j+LbQy77t3MYaXHlcto+uh4wipO94/ww
         3YSAF/l/XpJWa35qj2jVfU4O+r6BH/L+Hn2SgsNrfFi+w6oYQDinsor/CA8kA6oZskY7
         y8hQcdTbJVC0iI3TvFFwjsjIRCxG4Gn0tyw2LsYF0nDeBhwOCJjua1/2o+6YUl5m4ifS
         xMfVFtZ5yGjr/7UcQ0LKhzUXMMz3oKnZj8m2JwDPYvGtGjpakxXTkztnjiB0UNgWiYSt
         rznIK8CDIdN+eDsqILh4IYBWUMpl5Wjml1jJZl9v+VpgfTsQD3DI0/CsHdRN7Ro9g45x
         gBvw==
X-Forwarded-Encrypted: i=1; AJvYcCW2yX9D8hRSAzF5ru57yWvaEmQwhflDhBvPo95bMxVipiX0OYoK/Z50oZjHDVgsX9CDRTCz7AjvieXo67x2@vger.kernel.org, AJvYcCWK64RrtYL3zap35TtXP7bU8bM52VO/xb7lsfBK3tENL/iGDF79C22c9gpEnObpmlZs0MluqVkYVbjr/lg=@vger.kernel.org, AJvYcCWZmlCHIC+0UeshINumPvgeGr7t7l1RIOXuPAVpUkSCPEgFN1Nd0ZpnedL+4X0k7/aQKQyc/KxPYibA@vger.kernel.org, AJvYcCWeYhDyOnET7yIB6MWhnibaLGVLa3N2VqGVoO6AGkWK+ktEiGsDeqGb/N+aQyNGOPJSXXf4Q2L/hKdL3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNS5MkDor0ZxZZdVoto0TlZI0OHs3BziNpbAzapEHuHxJyLqo
	ChqdHnbYO2Xgpfpeuq4yYwdktvzuaviyg8Fwfd3BoCb8jOo4ayyD+ZwQO4Ew
X-Gm-Gg: ASbGnctottXRUWsS6AoWKa9wPjmbP0byIQAis6j79ubWz5557Zrrc5sO2e0IQw1Jz5X
	Ks1HLJreRL5VmczOdaFaNjxTmtnbdB16+938tPlkfmyutaPySbEDuex8d0AgXgFHemYsGEp8seK
	zH0IYEnIumImdSFp9ewh2P5ohnu6HXRmjnIrgacPBHYilytFSB5z5HKg1CuM0PQP1Uy1tf6qfIc
	9uKLa8FPMhK/k4BN2vWXRCuqh0QGVN6DUJUH+TGVs+0MOCBNsa3/3cMAAeMa+sfYB8PgChnJ+KN
	yg0Vua6sEA7smhbrjD5URctJRjN6TftY2Psfx+1DcZnjwqPgoCTG/iYry07+5vV+ZMyDM/XFL+X
	9qt/iC+SEOLoq0hwIUPLbLlLmZqygeTMld6xTiQlSdCQ3aQY=
X-Google-Smtp-Source: AGHT+IE39W/od8Q6Lv4eHcOg3CqK1TKtJR1QdKfM982lU9SVEinsuN6XuD5Bxq2jv1S2etdEW7jtjA==
X-Received: by 2002:a5d:64ca:0:b0:3b9:2989:b859 with SMTP id ffacd0b85a97d-3c32dd5e02fmr196354f8f.14.1755634398149;
        Tue, 19 Aug 2025 13:13:18 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:216f:2f7a:74c6:177a:3b99:868c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c57d32sm4939887f8f.64.2025.08.19.13.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:13:17 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org
Cc: peter.ujfalusi@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v4 0/2] ASoC: dt-bindings: Convert TI TWL4030 sound bindings to schema
Date: Tue, 19 Aug 2025 22:13:00 +0200
Message-Id: <20250819201302.80712-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series converts the legacy TXT bindings for the TI TWL4030
sound-related modules to the modern YAML DT schema format.

This work was previously part of a larger series but is now being sent
as a focused submission for the ASoC subsystem.

Link to v3 discussion:
https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/

Thank you,
Jihed

---
Changes in v4:

  - Resending as a separate, focused series per maintainer feedback.
    v3 link:
      https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/
  - (1/2) ti,twl4030-audio: No change to binding content, only
          updating commit message format.
  - (2/2) ti,omap-twl4030.yaml: Deleted redundant pins list.

Changes in v3:

  - Updated commit message format for omap-twl4030.yaml (PATCH v2 7/9).

Changes in v2:

  - (1/9) ti,twl4030-audio: Moved binding to sound/, added enum for
    ti,enable-vibra, and simplified the example.
  - (7/9) omap-twl4030: Minor cosmetic fixes, retaining Acked-by Mark Brown.

The following two patches are included in this series:

Jihed Chaibi (2):
  ASoC: dt-bindings: ti,twl4030-audio: convert to DT schema
  ASoC: dt-bindings: omap-twl4030: convert to DT schema

 .../devicetree/bindings/mfd/twl4030-audio.txt | 46 ---------
 .../bindings/sound/omap-twl4030.txt           | 62 ------------
 .../bindings/sound/ti,omap-twl4030.yaml       | 98 +++++++++++++++++++
 .../bindings/sound/ti,twl4030-audio.yaml      | 90 +++++++++++++++++
 4 files changed, 188 insertions(+), 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl4030-audio.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-twl4030.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap-twl4030.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml

-- 
2.39.5


