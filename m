Return-Path: <linux-omap+bounces-3171-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F360A196B3
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 17:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1122162BDB
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 16:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4014221517B;
	Wed, 22 Jan 2025 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gvvbq8c5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE89214234;
	Wed, 22 Jan 2025 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564101; cv=none; b=cw0w0dxXA8tJ531fXluGKFueRw68M9kiMsk3nZppesMoOdSLVZa8azbiOuNZ/feFtkSaUpe8CMHpXGxqOvhW0KRU+J0QVj7TUDnRaid7OkAWhT/lR0T+YEdUmnH5qPy4l9Lf22p7EAeenfII2dnWQB4no/W1HiEgFRriZ0jltF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564101; c=relaxed/simple;
	bh=jiVfRQ/VxgBfiwQVU9zJmJoypJnWZxxBuomdVM9AJIo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CKtanjk7vxV5wkQoDObkODHoqVpVHJMiM6I9F00byPiYhm3oShLnYLntj6DgiEYJ4iObO+ywpCp1uLi62Xkx6/b1HNqzHtb8NaSihuFZ+EcS492Kw1j9CMeIvZYzhJpZ5HKzoLmc+SDcw4tOtT/q2BRrWDFwQuFFSA2mXU9w4Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gvvbq8c5; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso10765777a12.3;
        Wed, 22 Jan 2025 08:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737564098; x=1738168898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T1DHMDWob4N3lDod+SNdK0dgpbfuTB1CM0HzeuyK6d8=;
        b=Gvvbq8c5veILIDWGHiD5CI+jKxBIP1fROL1hKB7gcyVY/B8QAH0iisWkoOIeEdkLTa
         aA5WnhCBr0un6QDV4WAw9g962f4+ytRnSAR9o9/Rp9mYZEYXQfDfFEL5QvPxjijqGLI5
         I1xmlajt7G/eOUwtWJ70/LoRBMAe96n2RKBwZsIkhxiqzeTuVr2fSuE5k3PTMjWP839e
         OBatKQD4zDufwv3xMOJM85msym+bJ23d7RkTdynzq7Jkknv0+JvQqE3/is0BHbDNwyvZ
         ZoWoMTw+D1t+0PN/jqNCtRvhXO4AQIragE28BQhG0vQeXkjlXdMYPt39gC2/1OVGptjq
         rUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564098; x=1738168898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1DHMDWob4N3lDod+SNdK0dgpbfuTB1CM0HzeuyK6d8=;
        b=xI+srP44vsszp/bniHcOJUc6A/GCKh82FRyDUWqXoNpSoNyUc/BdZGi1OmUZ4IFHrY
         FonXLhEKbF3MqxDQQklbtwHeVcludtU4awMjsiEWLYCTd4QQqOOfBTEMxOQAdzvrufig
         60334S9+OQ2KAmArjED+u052HqcGb4M8ZRJu8cdqZJt3v11fUKy7/pkFvRP68pUITcEN
         yvZuzZdH5sv6gdsqKSmq75zft0j5sOQHSn+lV4kCFipJTALCvkZ42+LoZ0IUVcWLJaTa
         xmpPJiLFxe/MA0U7kIOBpyq1q+HDqdYMdbR+3uHEdx6+L95/wD4VtwzPgtwrJqG6+5R4
         LYjw==
X-Forwarded-Encrypted: i=1; AJvYcCVCO+Ho66sYzHcim7edARYxTD2SziMS3/arvOYx8Y9iKiEGkuYrekW0EkcQVGvnVh5VTqlWEjD81mQr6mY=@vger.kernel.org, AJvYcCVQfigPKMn9y2Z+seECWNMUZ+oqIPYkGXN9IPw2sxYjrVKiRBja8TawQoLKwMPKlp3fofhO3EmPr4ANRMw=@vger.kernel.org, AJvYcCXkxHyJMusM8SUGz8fZQhpPz6EMThs3GfOPcoTFq77A/Pl0vLqTilWZ7tyuy7r6eKOIgh8PQl8jGRftHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXe7rFRVRWIUmCn6nBjj5lt9ZfCHF/PnG35OQFwXquFlv8OENB
	JX3D/FA1F0jAGg0UTpminBVdpiaihzgP2zFdC4Lgy4nJ75HQUpiI
X-Gm-Gg: ASbGnctKvOzTSpUEsNpd2wYpPm5ZMK51Biq7H7Fb0PTjKMRtDymwEbckOGGvIjD3w+v
	5LSz+0Wd6vZNGRmAGHvKrH08gfyOXa3YbxMbxIbzlwxAdOL/FBbdl3XrAx0FcNZgHN0YMnatk3w
	d5uJWzrZ/ixX2XITLpJR18RaWUQY0aXrxfMGmGlRk5OuEoizeLq/Ceahdqd2+F1LfZ92aR2904V
	zdYf48692TMoFHK9iiU/5B1Exar4y6VEIkpcG5y7Ca2GgIjOMQBrsbjd9LQZHnoFZcVNBbZvDSK
	zKuFIi9VKXC/SMPD
X-Google-Smtp-Source: AGHT+IFB1KDHAW9h8whxxYfLfNYJMsXyqslGP92r3EWJdg4rjFNnkmn3pr4fyA+4j22Rp/o5FaQ3OQ==
X-Received: by 2002:a05:6402:2747:b0:5db:67a7:e76b with SMTP id 4fb4d7f45d1cf-5db7d2e2ddemr20563364a12.7.1737564098293;
        Wed, 22 Jan 2025 08:41:38 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73642580sm8647061a12.15.2025.01.22.08.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:41:38 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2 0/5] ASoC: cpcap: Implement jack headset detection
Date: Wed, 22 Jan 2025 18:41:24 +0200
Message-Id: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpcap audio codec found on cpcap PMIC supports headset detection
and PTT button through its 3.5 mm jack. This series implements
support for those capabilities.

Changelog:
v2:
- cpcap.c: fix a typo
- dt-bindings: fix interrupts description and alignment
- motorola-cpcap-mapphone.dtsi: fix interrupts alignment

Ivaylo Dimitrov (5):
  arch: arm: dts: cpcap-mapphone: Set VAUDIO regulator always-on
  ASoC: cpcap: Implement .set_bias_level
  dt-bindings: mfd: motorola-cpcap: Document audio-codec interrupts
  arch: arm: dts: cpcap-mapphone: Add audio-codec jack detection
    interrupts
  ASoC: cpcap: Implement jack detection

 .../bindings/mfd/motorola-cpcap.txt           |   6 +
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |   6 +-
 sound/soc/codecs/cpcap.c                      | 200 +++++++++++++++++-
 3 files changed, 210 insertions(+), 2 deletions(-)

-- 
2.30.2


