Return-Path: <linux-omap+bounces-4861-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E346C38817
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 01:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4FC5C4EA547
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 00:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0199F1D54FA;
	Thu,  6 Nov 2025 00:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="N1XzEY02"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C351A9FAF
	for <linux-omap@vger.kernel.org>; Thu,  6 Nov 2025 00:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762389615; cv=none; b=KK8qhekYi78SozdXIpj3C8TMc6fo7yzxcpoRGWzPz3PhxyIwus0W1g9ooN8GZ/G//MQDWLEZfpQCHTiKnxsXHOs1TiYo0rvste0awKLbKejvWFvVXm9pstNfzaytvAFUf4qsW8S2FyLQ7Y1PgO9u4Fg9rdgU3fimdEUIKVSTcM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762389615; c=relaxed/simple;
	bh=rue2bCVLqqgDBX61ZwQetRzMYMuU2vRzhd7cN9vguj4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mKnhF9WEsUQgVwB58Y7BwwIewNKecjGXp7uyjmWqPjYolNnf6eCFkvLDliyZGghtYQs5Zvd2nrfmFHQ6p4shWFTnBsNz+xL+MyKdDjlgsU29T++NCJeUSKPSagYRterSXbL00V1jfSAFR92B33GQ9BRCrMjC/QKwRhVCeFfMJ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=N1XzEY02; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-341988c720aso364525a91.3
        for <linux-omap@vger.kernel.org>; Wed, 05 Nov 2025 16:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762389613; x=1762994413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4Fdh+kQLyNyqbGV17ENMExDWzQqmTQ2Vs89uoeAIDg=;
        b=N1XzEY02s0UHGtXIFG5sLArKhzYybx5PvMx4d4Jok/BZYT5qyGIzpzt28hnvxHn/aA
         IhGZyFEXohCeI6ZEfMfKBfmTAg+UkpHIZiZyOgp0zMOBByq0jHdbt0B4aMeJvLmtvOOF
         0cUtjvKXuXDUt0qbDhM/8zL/ugo3Mla0pjoBomnAfEM/HKZtjXHBiF0j/9OXRUzVqvQk
         zQqGYcj7lTq1FCQLFbbpXJweoo5BhPwNLotTVZbXP9SNZztmCb2O5ge4onqvNLDJVw3T
         x5DMvzDAMM1TBNEi6kbaqw6WiN4VQiM2VTqRvWIV+hyYVS4ZeHs6TSSA482pi01xiO1Q
         tzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762389613; x=1762994413;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4Fdh+kQLyNyqbGV17ENMExDWzQqmTQ2Vs89uoeAIDg=;
        b=I40BdZsEcO0BZfZLW8B687yD4z4GiNfOcoRNNYHiu7xDu2svmNQodJLV3mUNJEQup8
         TMVaYjZIwUHEkiwWSN1eFuNR/JZ21KN0YL2ofIfUBtT/ktTIa3ICxboYCSnOhDUODqvm
         oRoega5/woC+gpTNapAOkdKMnGQpSfoNHkLfyqFcbpikrMiw6av+Kr5wkjOjWUP70gH3
         nne7hjrlYX5VRY2kgWsb6VSYsfQXTDY2ntx6+6r55v+4W7Ut/xgl39W0ax0QxAHbD87B
         RMzLEGZakJjcJccvw9406VHLiskmq3DiNe0yjTcnAg+uGREXnsxPXxBohyvTCNuUWZb+
         d0BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxpspXNIK+Cxj3M//fZ9v3l8yE2+fo1AJE4R7JQALwQSTg/R7ZRjr1i7EURWqoN5tJ1qK6/Jv815NB@vger.kernel.org
X-Gm-Message-State: AOJu0YypIY3L9wSMqLl568sfHHdikjCzmtw6xRvZ3i4wFqla48MAW86w
	iuF2xptfdjqzfNAys7HDQD9JdligAaalluv7Gmp6hNWqQ6qOe4VrOIjibfoipt2xVfg=
X-Gm-Gg: ASbGncurTda/NoN3dszT+JLRegcq6E0gCc100vu7rgsFcnokssz5+ihnDbn8Ba9cq9b
	RoYVRdHu5oAUuAW+yaxY0+92ySX3vrGxaJwE0Ume++fCjQg+Lh7KHGBVVA1YBDsC2UYm/pflmy9
	LVqwTF4rjVGjLUJLBmeqvvKSAWp/D+YhmlC+RSxuOZXMnOm2Hu45naPt3loBX6qYfte34ckcrKp
	jMHL8GQ7kA1xPLZBW1q7gWuWgZnVtCy5w+X6FvQRZYyd9xC3IVzjO8TH/o3C4O4d+ohcYxzXBL4
	i6wnEZYu5DCwGb0Qk3mAFedNKECPPbnL5Wda5gKMmwdJs8Ad8nyiwBRYZXfEbi6Rt02BDYyEjB/
	t2su4sH/VSsAJSVw63XcmkuBfcBPssW2qKg+Upe3AE1ju7DWsviI6uTktD77YG2kThnpticzWqg
	==
X-Google-Smtp-Source: AGHT+IEcLNKZAx7Gs58quiN/BqhCrVzUdA9uzXWTUpsiUUbQ/IIuN6vGZJk0KYstqzmC11nr84QNuQ==
X-Received: by 2002:a17:90b:4a84:b0:340:be40:fe0c with SMTP id 98e67ed59e1d1-341a7009dd4mr6232479a91.36.1762389613281;
        Wed, 05 Nov 2025 16:40:13 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba90307193fsm507604a12.38.2025.11.05.16.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 16:40:12 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, linux@ew.tq-group.com, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev
In-Reply-To: <20251105-omap-mba335x-fix-clang-comment-warning-v2-1-f8a0003e1003@kernel.org>
References: <20251105-omap-mba335x-fix-clang-comment-warning-v2-1-f8a0003e1003@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: omap: am335x-mba335x: Fix stray '/*' in
 comment
Message-Id: <176238961246.3045323.4889142584936333323.b4-ty@baylibre.com>
Date: Wed, 05 Nov 2025 16:40:12 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Wed, 05 Nov 2025 13:41:09 -0700, Nathan Chancellor wrote:
> When preprocessing arch/arm/boot/dts/ti/omap/am335x-mba335x.dts with
> clang, there are a couple of warnings about '/*' within a block comment.
> 
>   arch/arm/boot/dts/ti/omap/am335x-mba335x.dts:260:7: warning: '/*' within block comment [-Wcomment]
>     260 |                         /* /* gpmc_csn3.gpio2_0 - interrupt */
>         |                            ^
>   arch/arm/boot/dts/ti/omap/am335x-mba335x.dts:267:7: warning: '/*' within block comment [-Wcomment]
>     267 |                         /* /* gpmc_ben1.gpio1_28 - interrupt */
>         |                            ^
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: omap: am335x-mba335x: Fix stray '/*' in comment
      commit: 35c973187f59328a5a58be132bd83ec2fe076620

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


