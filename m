Return-Path: <linux-omap+bounces-5330-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F148CF57C8
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 21:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3442730CCD38
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 20:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1044922097;
	Mon,  5 Jan 2026 20:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v6R/x0n/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8111D7E42
	for <linux-omap@vger.kernel.org>; Mon,  5 Jan 2026 20:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767644159; cv=none; b=U06x0rsrob4h3RkFVUf6j+2t6jv940ZP8RxEhFK+sxwoaGVUgqmn+HyCmLMG4jSeUwW8erdiCw5sCIOxRII1Kle/vofSf89pmId6HiqIX4e4AIBradoYlxIFfJVBqs+Nu47PpxDyNjX/SqCTzO85W23o9psB2Q2Gm+sOTQreUIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767644159; c=relaxed/simple;
	bh=PWuIy+WsUlN+W7DmSo/pHhR2+QAndo6fSWRuIjHhlOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nB5m9j5224VUaWEI7pqY6TiueXopBt2AMd6r6/HMVWnPuVBzfoS+K4aHqKOLPXww4aqj0kGGowOxHFMsgvAHDUAsdbp2QF45EAvR0fpZhHAy92QNhE6QWZdBmWr86yF26zw4tv7h7OAEQIhsC4PIwdnhLcbeOurSkEp641eeM2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=v6R/x0n/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0834769f0so3214555ad.2
        for <linux-omap@vger.kernel.org>; Mon, 05 Jan 2026 12:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767644157; x=1768248957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJ4pvYMRzKvn6d9TmERsN5GKYq+cuiUXOIc17FaP20c=;
        b=v6R/x0n/cIgGZdLDynbncHJuvYnCfJkR88CfgPk7B9DUbvGGY9CToKeUK/+wDs0EG6
         vBJg3S0QV71QjEYWe0c519k7CnkvFqhescP2C1BW90sceYtQsoJqWfitraqYI8HE0oHj
         MBfiQZAI0hZt4ZQBSgxB4rnC4s3n/JiWw+JES0dlsTrDPALHZ/t58qPAdvoLqPkEKzrM
         pFyCAec+aWCzEEhjXnZ2BfkdCaZNOAQyUuSrN04u6t8p7SilLZnQnGgmJzYfyz9+vfF8
         2dpieibcw+y1Kj+YUGGLt1URqWuI6TD24IHfWrNlrO5SPxU1XM+jG9yJjiUaxSOcsIVu
         CRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644157; x=1768248957;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJ4pvYMRzKvn6d9TmERsN5GKYq+cuiUXOIc17FaP20c=;
        b=O4GUOQIaT+4y+3yppGrxT6koCsKSmMI4hIr8LP7t5jgc9YzJmuEIi29SmwCoD0/WpZ
         iGX6iB6WEYdEeA/rfA68R4HNSuZinr/yTjvwYBiROLy9evDmiEPOhhbGUTXotcBkw/oM
         5Vak49J2ErvFcDIALP5AtGWZ8yVhxUgrW1naKHqcBvFXToQoI70hh7irZjRULfKzkjJ0
         H83Ai3HQub5vvWkExHiPc6GqZHg6x+KvMriR3QG5Na2f1E7n5EMD1lITFYwFvMsn1L7A
         IqE1PI+nTxw2pfGglh0GEpi+nO69DZHGDiUiqt5fD6P/BMy33l68AOVSxnC6HRKzverw
         8N9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8JeNOLC/kkp+5dYT5UvqI+fXftJ40mdvaridJDrwy6ZF0umHNKzoONctijT4O8YD9IHzs0AeS7B5v@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmr3QMJ2AC0bC04eaZYcrFVdYDc8NjkavVrbJETsQnPyNwyMsc
	Cdek0NdQvzmPvQL3p0nTNeETkWxgvLx4yI/zdMlxIGNt1xXZ50n1zS3slwvQNaI7Onw=
X-Gm-Gg: AY/fxX5twxN8/8wHjT/I1hBT3vJYg6aL6bv1B3r68sLhkpZKpZ1byPuZEPy5FMK+6jq
	z9MDialGggqaeozaEIII/hh51aWOLjuJ9pzKBePBKIk5RHNzTNIzBCqN+ju+7GcMJyaZ8R80DTc
	UVPN+/OD90ljEZ3BLU7ZXSfoLg2vcwVnk8NcBQl8mOLSmuKfOry6iZ/EAmzIjG3kq+4jXnUOccW
	zZqhAXXl6JGAK+PwMpsFIP9qqdFLKT2WGozbO30vSesKb5OObByRliW3qF4w7f58V85kyqZ8MVn
	+fGWy/Ecr44n86WRMAJakab0NZ+IBxdLbypjLbCs8XkNXZxDM98uIZJtf1Nthrv0PJw23ZWQQ2H
	zSpHYa7770Ycr3ed0oZr+eO8l2n+Bcqicg6+lhtDOjlHAkkhsl21KaegeiSDTU7IDAohMrMwFUT
	s2HIDMxTSvrDWyhND/QFY=
X-Google-Smtp-Source: AGHT+IGjBV37hjEyetgmadgFLSJu/2Cv88meimdst9anRhrcUUNmQ6ZDaJddTlwwsnyBRUMebPcXfQ==
X-Received: by 2002:a17:903:2384:b0:2a0:9a07:f8be with SMTP id d9443c01a7336-2a3e2d9e1dbmr6999515ad.22.1767644157206;
        Mon, 05 Jan 2026 12:15:57 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4795fsm1020725ad.33.2026.01.05.12.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:15:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20251118154856.2015184-1-alexander.stein@ew.tq-group.com>
References: <20251118154856.2015184-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: tps65910: Add gpio & interrupt
 properties
Message-Id: <176764415635.2561401.10050045806328999741.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 12:15:56 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Tue, 18 Nov 2025 16:48:55 +0100, Alexander Stein wrote:
> The binding document ti,tps65910.yaml requires the controller and
> cells properties for both gpio and interrupts. As they have const and
> fixed values a default can be provided for all users.
> 
> 

Applied, thanks!

[1/1] ARM: dts: tps65910: Add gpio & interrupt properties
      commit: 25332069532ac030b1185bb8084c1a5298c12bea

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


