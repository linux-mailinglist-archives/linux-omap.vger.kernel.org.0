Return-Path: <linux-omap+bounces-5328-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33941CF5732
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 21:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E8ED30E5690
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 19:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047CB313287;
	Mon,  5 Jan 2026 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xH5SRAAo"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3AD2D877F
	for <linux-omap@vger.kernel.org>; Mon,  5 Jan 2026 19:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767643123; cv=none; b=DziwpH4cwqV914vlSCaeGlMEh3niQu6FWq6wY9Yd7sspAxp1DlQuLpvlRGaFsoairs7oszTki2B/qodvQN20FaDETPqV0Gys4DLRi0uBUyvQ8QW9Yuw3kIBKYMFoXagR00LkfI99rHAPvWd8vkQQiLHeZkwl6xBvlhaE8efGPfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767643123; c=relaxed/simple;
	bh=CxVKhGDUVdar99K8djRu2fcVmXQSmerROo4vCYk071w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TrO4F50jlog0YE93kVX4YR3rD2Gnf2P3ZRHjJhFQgwbdE05NjepTNQoO56j1k83eHkjXpqWg2tiDDEzP2XJG2FO/a+winEOOkA3eCo/oy4uZOCKJWr5/G1/rcZuk9lxKYKUWzXdStXgFGZsXMFdp89KKXCy81Aeu6dDG8GxefgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xH5SRAAo; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso327594a91.1
        for <linux-omap@vger.kernel.org>; Mon, 05 Jan 2026 11:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767643121; x=1768247921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMKnhOTGNAjVd2/nFMNWbldH5lsBWzRxoH2/1+rFaX4=;
        b=xH5SRAAosBhOXxZrCF0akYjASGfiMBim/ky+HVnMAZz1nTkLZqaVPerr6TEzFFShXl
         /NcWV5RC+pQSceUZj7ll+/gjwqU8VNgNGD/kh1h7G9Dq61Wlwxazpybd7kEU7/V3hQkq
         tNk/YKy0xPxt5g7Eo5ya8TQW9DknJHrIPygKIBh2hu8IgL6l3hAtfvsCrCdBB3/d9Ehi
         VQT0wyWpss5QeR5XzmSXxv1hhXF4kzVXFeemYfQe2SV7fNKsM5xyyHiP2KFciEMffe2v
         gfHWMySFzp21QMxLJne7Gc4lXMbYryEyjlKnBQcivCmQx1mu3f5APZAeFzdBo6YSwxcQ
         Yifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767643121; x=1768247921;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qMKnhOTGNAjVd2/nFMNWbldH5lsBWzRxoH2/1+rFaX4=;
        b=NPZ+U6nZPDmWkoPEA8Sd3BC4U5xuxUYeJGqVw7jStDFg9PLQx4WSC0/H6VmUujnytT
         JU2cQ0x3RAp5KfYk2UcxalhZnZpei12MYBSs9r9bV2CWWDJE9Fpl3X1SFdoFUYMdgs+6
         NX17ZB3Uk59rS1+5Fl7vapEwHzqqPyjTl/KDVqi5qOGQwUuXzEVz6GXrEtIuI1WDd1vv
         XrO20js2X1TkPBYkInYnHAEGJPvdnm39iP/wX9SKWGslDVt9LvP7mX/b39EKBB9fb96e
         TATDdFC27ksKUVizjT3WzBsMuzJPSS+aPr5qdlrtexroXRvI00PtQxwAT7stox1nv9QW
         jcig==
X-Forwarded-Encrypted: i=1; AJvYcCUh2fmwhf3dX2m9H1srVEUV+ssJifE/2tt3irIF4hKVENVRId3CEmf3wAMUeS2KAoYIhVWppH6s0L+7@vger.kernel.org
X-Gm-Message-State: AOJu0YxQuraoZtIW4LDtFnoPNPLPMc+1uSclbIh8AEhS3PAeqGqSjZN2
	Qr+oSzfmQxFt/Bpu2eBc2JXkA5W9y82NxKkYb5nKJrRJNDrbPsj0VU+LNMMWtpppUyo=
X-Gm-Gg: AY/fxX7EapuOSrEA8/7uhISjVLrYWn90sTg0tNiK3LS9dUqadZTzVmKMGzeU2gVbxXV
	lr72I8VxeGIEeavdKU5p3tY1eJeDbMIiO26MZKSf1QetPqclUcXFanOzMi9zwDoUkzFuucPIdU3
	BE5cLFyJNEOzOUSWZiUBKp4BB3KGy9ttlTOMJZ2KyYL7ntImSLVsFF7YqHRHlhcXwkIek+iEEuk
	jjqGIUz88XpFNdDffZP9T4L8ojFJi6Q2MyGIqB/dpS+W9/ME3Ge9ARHnk+bbOxf014n8qINlWaS
	MJigFSPF/4iuhE2LooyZOk0MwTiUy9AFEI9dfI3OLxpYrx3u5I/1Nq3GT9K07JyOHiqpmrtmqSX
	Dik/wkDsZJ5bRAI7nS0VgL9JzAA6QjCF7KiNy7rJkiZvyngh65KzkxjJKpFweqR2SvEyHgHOJgy
	7GrawM2Q57
X-Google-Smtp-Source: AGHT+IEGi9cGKENq5rNAdmv45r1s+l2IGnADXil10NZEb0OfhoaHXMJx3qjeTXpbOXG+UM9q7rptGA==
X-Received: by 2002:a17:90a:b313:b0:349:3fe8:170d with SMTP id 98e67ed59e1d1-34f5f27b7e7mr212490a91.3.1767643121248;
        Mon, 05 Jan 2026 11:58:41 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa955f7sm179439a91.8.2026.01.05.11.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 11:58:40 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, akemnade@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
References: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
Subject: Re: (subset) [PATCH v4 0/3] mfd: twl603x: add power button
Message-Id: <176764312014.2556028.2258989814946159772.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 11:58:40 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Thu, 06 Nov 2025 10:00:24 +0100, akemnade@kernel.org wrote:
> Like the TWL4030, the TWL603x also has a power button feature,
> so extend the TWL4030 power button driver to support TWL603x.
> 
> 

Applied, thanks!

[3/3] ARM: dts: ti/omap: omap4-epson-embt2ws: add powerbutton
      commit: 24571ecbda52f7a43a7dad1f7706bfa81fb1fa79

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


