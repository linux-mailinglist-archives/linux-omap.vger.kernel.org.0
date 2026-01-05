Return-Path: <linux-omap+bounces-5336-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9035CF57F6
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 21:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7804B311F8EB
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 20:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78DB31D37B;
	Mon,  5 Jan 2026 20:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EumCJn6i"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D8346E43
	for <linux-omap@vger.kernel.org>; Mon,  5 Jan 2026 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767644166; cv=none; b=mykYTUvEob7sHFoRvaim88HVFKtaGw8ppA+DtZA6bd4KR7bdk97ttU/W/BspzAequpHVFSFZsjQkWh44ynE7KxhUgbpbWWiL3GpGiwEdmID2rsz/HbeVJrLW4bjgKCGanevAt6TBTnhkwGvr5rBvSGjMDIIYMhxMNy7m6NPeG50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767644166; c=relaxed/simple;
	bh=vrWvuBWWkIqJRjzwJR49BS8lxWZbt4dUcR6EDgDcVEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bVF36pOvH6k32ZDF4mZCW/QTzCdZWIm27s4GHM+1VxUo/xwBPrgwV13aiCZxCeMai4TFfkPYdCtDdl9irZLKKO+e+NH70Fwz9ycl9Wn4dbIYbVM8SmiQ6xYIcK5B78KO3hEp73siTuEahyn4eQwtc7BUpLoso9T3E8ZB+INHdtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EumCJn6i; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so365023b3a.2
        for <linux-omap@vger.kernel.org>; Mon, 05 Jan 2026 12:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767644164; x=1768248964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gM/0NBeBZo/IQy3QHRFeMfe2d0xBAbWbFb4SKMpPqz8=;
        b=EumCJn6iLWL7vFOaBgbm3LTKYP8PxybnGRariAhNcwnMv/ORZXPH4SklYkoQhLh+hB
         p7ck3D/1rB0WeNZqe5tRFCoSrY/lCO9n0EYx+LC3iHxRmB7xgQWrwidvaEujviVzkHLZ
         VtmfVZQNQx3+e/rusCLKFgxx5HpVURI2rRLIw/7jzQEPLqm5okqI+XiYJwbT95405FCO
         vm64OfPi92CyRrsBMkNjn93w9VnxfITfaJDV6RSKb1msSONbWq1GovczMZff5rB7tx3y
         9McLT/ovOoGinzo6hhUlwPHqUqT2eNA13KordoDZX5MmsuJ4eZyaizFv6Vydz4vfTTJN
         8UVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644164; x=1768248964;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gM/0NBeBZo/IQy3QHRFeMfe2d0xBAbWbFb4SKMpPqz8=;
        b=mZAuy2dhXIzRNU5lXz0o7/GLE+5quw1l8nI6iavys1cY2qgq2dZ46AK8ujCnWq/VBy
         4moOSyr/7jAGKlaKBXtkP8xkKh3BQgomBUwR2SKQ2MeVKiS9hc+1jFH4SAKhsDrV+2rw
         X+AJSXJnX98ljotdDiSMT8H54yhPcUOXVEemFWayXD9XEDlPnXYmhmt0Siy61ZDOuqq3
         SujqK9Sm6H03PC4jM8qltbgJiQD8MexEfkzDpQPFBEw2CJrAf5iL+0kSldrSsyV62n8Q
         svFJLyzZ2IOW/mLIV2QNd3uYF7pJ7MAqNChYxksMbGTDLMe2uwZY13wcXh0wqycW2/zr
         tvFw==
X-Forwarded-Encrypted: i=1; AJvYcCUlv6TmbpuB4vb/witBNZ726h1hzvBwFASJMtxeoAVAk7gB78V6ZkuO5JXgEftuNAWLwJEERKROi1X0@vger.kernel.org
X-Gm-Message-State: AOJu0YwaziVB++S3L36pkjyKNDnXL9TldQm3yKBT1bHRxAiLFUp0ZJzP
	IuqziZZHaxIoATLBDZvgznqgiWxiIhPSzD7RBScA4heR0bNONPr+9vBnwbi/jtGzRiY=
X-Gm-Gg: AY/fxX7fZGrBc/p/o0jRv3XkwbRiiVZ8ixsEUXQkzjX1gRyBvgRfD+tRxMJlfRFHi2E
	FEg8AElC1rWifnqOp7I7/FWz8aara4VCb/zMeRlXZP1cqTfwHIoc9/lqPh+Qvdf1WxOOPil3tN4
	uFS2XqARH+eqdgePTIejJONrx3EZDheTALTvaASjuaAbZzIqzNo/kR0kKzfGPX9iv69kenJgoRg
	1XZIIP9A2SvjuwrNuqcgWxVMOuzj9nE2XotlCU9lxPQSXRSVSWnfgE57T0U/BErrPAm4jEBUkgo
	41rWGC2E9QNHAaHA+D/3GpH6L551EqX1FGT18VOkL+Efa2GKcQW0UQDxNiU0HCPSVUjyj0FH7vF
	ESYOuDa75VW8keTF9SMhvebmKUtcNlxHhN90Pyu+jMUDHoPa/kqLYebNKHT+UuNkPFCXJvYqcbX
	39yDY/i26e
X-Google-Smtp-Source: AGHT+IFv+URzhFo62S2OJHIOtV3yIc+G3XQJLuGIrCdc5mHktNrWdS8zWFn48CHW91APTlisHxQKQw==
X-Received: by 2002:a05:6a20:d485:b0:361:2fe5:51a3 with SMTP id adf61e73a8af0-389823808b5mr334370637.39.1767644163808;
        Mon, 05 Jan 2026 12:16:03 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc02ecfaasm209624a12.14.2026.01.05.12.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:16:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20251230234040.2083889-1-vz@mleia.com>
References: <20251230234040.2083889-1-vz@mleia.com>
Subject: Re: [PATCH] ARM: dts: omap: dra7: Remove bogus #syscon-cells
 property
Message-Id: <176764416284.2561401.7444989303329594096.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 12:16:02 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Wed, 31 Dec 2025 01:40:40 +0200, Vladimir Zapolskiy wrote:
> There is no such dt binding property as '#syscon-cells', remove it.
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap: dra7: Remove bogus #syscon-cells property
      commit: 76f88d2edd9f21acad7be8422069403118708455

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


