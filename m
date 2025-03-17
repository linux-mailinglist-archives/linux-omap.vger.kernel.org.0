Return-Path: <linux-omap+bounces-3402-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4914A65C7B
	for <lists+linux-omap@lfdr.de>; Mon, 17 Mar 2025 19:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5D8719A12FE
	for <lists+linux-omap@lfdr.de>; Mon, 17 Mar 2025 18:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0497619048F;
	Mon, 17 Mar 2025 18:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lYXq05zE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA151C07DA
	for <linux-omap@vger.kernel.org>; Mon, 17 Mar 2025 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742235918; cv=none; b=qrqHQnTtoi6+/BWJhM3seVjfI36TYb+mYDneM7ROqCCRpq8HCE6O/UUmNgzQY4lLOzWMXl3tdigqyC88S348eLQbzcBcUCMIrdsBRCZ4waaL8I/15RZR4e2jbRFKI97lICHNPiqoKyitzskG7lfVnzfTgktiLKXDzOP9v27miR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742235918; c=relaxed/simple;
	bh=F0kSk1oaVReSsBSXx9pB3+kykUsoZNLk1JX4ooTBvp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fP+J9I/5qQ1blHi00urwBuc9aoR9DZ/7FI6oItTmAYBU4vVh7UdGrZXe6nsobOH9UJ4k2z+7K3Wq9XaAy6/6YLafoCrdAnydNmKJERS+SCoqWpKAOy14uYPeDSLobgSHrGHtxZhSbXfDIytnFNJXP58aVQy+f333KVw77Y4fyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lYXq05zE; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-22359001f1aso41703645ad.3
        for <linux-omap@vger.kernel.org>; Mon, 17 Mar 2025 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742235915; x=1742840715; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=POAt9Pl6v+5VOwi53a8XwCwJ6f8Q2+wA88xSDSYqCd0=;
        b=lYXq05zEkhwD+2OGIcrN6bKlszyM6zq5rAipJZXHebK6w2Z/i9nO5Vj5ThidFYPe+A
         UWOe1G34W0nBeHTzlob7C1pCiRkCQ1lz5JI/fq5LMoCWrkFSFIK44d9R4Wl/Ult9Wcb/
         zLtxsIm1XFuYsn8sIpAFLa0zC6/QXRm1BX/BpMHHUTWQdEaZdbbXnAwbEATvJuLu/YVF
         Y1KtjJfvF1kI4yRfm2DveNPO+dAJP4xFYAbZA7Pf/fLNQOe5GKPqGad/WzEsk3jSq/+e
         v5q4hJt3zKmSRDaI9Irey6ijj5DLKO2ZjUR1EleaQUJYvYHU0IyTdx31nuuJB649/EVL
         B+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235915; x=1742840715;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POAt9Pl6v+5VOwi53a8XwCwJ6f8Q2+wA88xSDSYqCd0=;
        b=WS+yezTI9JiL3a54ZMvoLIjOyJO7YDUoZDu8kqiBrOsmDS62Nh0TVuFfbZGL2iH6vq
         fNZJFKDajWqIZhgUZbGCmCDY0UOy59WC4qE2C5F0HKKYWFoJwnXjuzbwrpDJo556QZNM
         tue49gIfYHmhjmQRb1g5m015OzA2l8HVMCUR2sF13fz5+R9TVmfeXsilx+B44s+YUEsm
         fy9ZpJrNwGQM3+OwJMTMIR66fMSFppnIVzmWsXaY76bi0SvXdxwR46S9lzhH5lK0qXt0
         FMAHda4o1f+ifpsbmYVgB4kp7YPB5a7wGQ9eCXz+i4FwhC638YdT7ZvxiBjEoetvUoaN
         jnZw==
X-Gm-Message-State: AOJu0YyX7EmsTRVax2Azmfxayumj51ggVP2sPScxIcHhV5x7eDLjIoAM
	PDbTyt9QwQyiR7Qx4edE4wcjFTgqqeFw5csebdRB11jp9OGahaBgOl6STsA/12rl/Qbfa6YkOH+
	I42JF1g==
X-Gm-Gg: ASbGnctcPkd+vsaEbXFN1/eWszNxez6yykhENaMQcx872grqW+4DH250zlTFToUsZKk
	fquhTsXMGabhaCGLEuD2CiOYNb/zbLE3yl1RFCF+IRioDuItcdidQPhyfwOrSyoa75QB7Z1SORj
	S+ln8WfsKeOdh6nwyLoITCxOCIgLNn/QbgmvVWXBYmBPpK7u7OrAzBUNtJpqCMsqNrSpIR6GI7G
	DcL0X2NcHIRdShGzWd//zHSv2rtMponIK1OKowCUsx/PjALZjddTLlp+SOjou06FeoS1MJR2tK6
	vuXnbJc7vZaAbtSX8HL1KA/I4vnklgB4aaQgzG6cx0c=
X-Google-Smtp-Source: AGHT+IE+WFZbIbKZVR1Ierd5Hw06H1qgwrQdddFAnectjHJowyBTGk1xMScRIVqNGcKVFoQUH+RMIQ==
X-Received: by 2002:a17:902:c952:b0:223:6744:bfb9 with SMTP id d9443c01a7336-2262c5ee786mr6788795ad.41.1742235914800;
        Mon, 17 Mar 2025 11:25:14 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a407asm78970415ad.62.2025.03.17.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:25:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: misc. OMAP updates for v6.15
Date: Mon, 17 Mar 2025 11:25:14 -0700
Message-ID: <7hiko7qzud.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.15/dt-signed

for you to fetch changes up to ea07a4775df03852c353514b5b7646a17bd425be:

  ARM: dts: omap4-panda-a4: Add missing model and compatible properties (2025-02-05 16:26:34 -0800)

----------------------------------------------------------------
ARM: dts: misc. OMAP updates for v6.15

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: dts: ti/omap: omap4-serial: fix interrupts syntax

Krzysztof Kozlowski (1):
      ARM: dts: ti: omap: Align GPIO hog name with bindings

Tom Rini (2):
      dt-bindings: omap: Add TI Pandaboard A4 variant
      ARM: dts: omap4-panda-a4: Add missing model and compatible properties

 Documentation/devicetree/bindings/arm/ti/omap.yaml        | 7 +++++++
 arch/arm/boot/dts/ti/omap/omap3-evm-processor-common.dtsi | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                   | 8 ++++----
 arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts              | 5 +++++
 4 files changed, 17 insertions(+), 5 deletions(-)

