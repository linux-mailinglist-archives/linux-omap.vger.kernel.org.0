Return-Path: <linux-omap+bounces-5479-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D47D219A8
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 23:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA4C0301C359
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 22:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637BB355020;
	Wed, 14 Jan 2026 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="owEaZ8CN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA235502A
	for <linux-omap@vger.kernel.org>; Wed, 14 Jan 2026 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768430100; cv=none; b=NfNY3ulQdK5zm9nEL02N0GxdjxTG6VlV2zw5SGKQC1DkZe3Wu+vfpLS6jyoeVME1f/Pf9iWOYoj1ZkK00t3d9UDe3ghJJ7SH2lh4gBIREzcUE3CoMeE3Zap4c5od/P29dziqbbVcLbcK1NDJParKxKKttLx7w253KkQOke8VcnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768430100; c=relaxed/simple;
	bh=rkXecjMSZJqrh9fG14t+9TRB4rMUA2qZtGysbYGm/ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nhahkcKHosxWJvq2oDtGsFPuAp+bAh341B3KhqzYK9sqg0TVj9MJBpZ7Ch7QSluk6TM7G7BtQ+ZqP5qpkQ8fCZhrYCofGtr9GiWfe/nTEp9DbjUjoua75vqsrjsAoXTE5hFyIvZPB8S2sVkIL84ZXt+/HCl19pjfoUVauJ5M++U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=owEaZ8CN; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso155824b3a.2
        for <linux-omap@vger.kernel.org>; Wed, 14 Jan 2026 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768430091; x=1769034891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaN9FO4A4LxOCPhjxS7OX2+XbqtwPFwBh3Y2D852jM8=;
        b=owEaZ8CNeTEC7Qnb8TMe4hUD6d64NL4JZexKPdFvlXtYo53YV3gqSEUuPEqvxdSTga
         DYAJjW5DyYWet15n/N6SDzPb+qttCcU8RR/738G9caw+RNMX/MgARe3/muHtTr/NrZ48
         ZnJc80/7PXjQqTKbFyxmS+A8DAnsicKRJV2byCTNKpOhm+FGP3/cM2IKNA4a2nMWCiSI
         ac/XQsHTL5IhMIzot40otWeFLWk9xFc8xwMkIIk+rlTbDQ0nPxRuYTkei99Qo3W68TMS
         YBhGANzz5XYDey9NiQfnVGhgFMidM2DbYnkTAogWJ4MdubW/7/tKlSUXhL/N7u2y2R6a
         dSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768430091; x=1769034891;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CaN9FO4A4LxOCPhjxS7OX2+XbqtwPFwBh3Y2D852jM8=;
        b=rCJk8Q2Sr5aTmhMl/RTxFUDTfrrIFdvzffl/Er7nUEMOqWLOwj7IMqNkJjfI92kh3n
         AD3oHxBZo3II8TAkf16AYeeoZ7NhB/Z5ECIVAV8ityN7WI1JIVHgySFKw91OxwygRhu3
         KRlMJ+vImw+QqkRXA6VqvLtLFYHCSFxlHkYUY4lnLZG22/RyYmcAVCHky6R3fPLdr0/3
         +KvD5BECXYPZYSw5/oavxCV8HhBRZlez0eyaId7n8doUFja8LH5jZpS7EOgIWXc5kLvR
         oeocfMVP9COT0BvU7dPMfRAqdrVW8r3d75w/3ITpz0PXJ1ymcv5QlqQDnl6a6x6iHAmt
         4u8g==
X-Gm-Message-State: AOJu0Yzb4azymIbHuUmwHf8560qbA15WqsU4HWV3dKLxClWSWR5dvnUt
	NoEK45Ss5OsStSKivnWnCSVQ6UwCEKCOxKMaAtUEzf1/mnrB+knWpWsRz72+2IYT/0s=
X-Gm-Gg: AY/fxX5bWUy01DUDJZXCS93OeM3WfBB4YP3VxJAcgC1HFm59zMIQ2j32g9FFbw2x0a9
	HP/u4qrxUKXW4c2d//yE3VTf4S/W9u6pBfy8KnrmHexdLQkMSaFACKnjJr/OY2R6g9KCHiCebEy
	H1uIlq9zEX+R+8dJ2brGDA8rXA3JrUvnZEMs9bkBHuKj8x6FhmuAbr5rz3gf7HnF4sJB18c7Nfh
	DZpRStypCmcDFBujB/YKWXxnyUafAzcXkfk680FGBOCl2HCCroE4Car1pRxPIEGs0YKnoTOtPNL
	PpX20CjRL4NBAktGpxKB71fzMPfctAxgOBRoqYgoD0Ex8IruuWcq1tCQ1d6F2s8qAO80Tukwo3B
	BPZhytuOwtDUJio6uiH1eoDRRRPwojTFfSrYMjVFotKzL7l8sNJBP0JHDmA9nIwd6+fRrLaF1yB
	9sbPJTs1X/
X-Received: by 2002:a05:6a00:2790:b0:81b:8841:fe5 with SMTP id d2e1a72fcca58-81f81b710bamr3773606b3a.0.1768430091299;
        Wed, 14 Jan 2026 14:34:51 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e64bd99sm534424b3a.31.2026.01.14.14.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:34:50 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Johan Hovold <johan@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251219110259.23630-1-johan@kernel.org>
References: <20251219110259.23630-1-johan@kernel.org>
Subject: Re: [PATCH] bus: omap-ocp2scp: enable compile testing
Message-Id: <176843009050.3580410.7527944288448371669.b4-ty@baylibre.com>
Date: Wed, 14 Jan 2026 14:34:50 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Fri, 19 Dec 2025 12:02:59 +0100, Johan Hovold wrote:
> There seems to be nothing preventing the driver from being compile
> tested so enable that for wider build coverage.
> 
> 

Applied, thanks!

[1/1] bus: omap-ocp2scp: enable compile testing
      commit: 5e2d6fa48a841e419848a811a015f61128a149ce

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


