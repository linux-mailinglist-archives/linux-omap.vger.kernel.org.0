Return-Path: <linux-omap+bounces-3270-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8689AA29DF0
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 01:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F9653A7B29
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 00:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0C64315F;
	Thu,  6 Feb 2025 00:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="stmo4099"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6862118052
	for <linux-omap@vger.kernel.org>; Thu,  6 Feb 2025 00:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802235; cv=none; b=mEthrhqqg3QWD8iEPM/H9bva/HD3/TRLwkiK6nYLlhKAjLIpeD22QN74+TUj8gF3qmtmD1I4nI1uOZMOXq9tARnj69vN+kF2eZ4+eCKhbJdREfBVjP06b4BiudCA3VKpXUu9YanWR+wn+4T+z6/IV9WSZtnSLZUw8SqnCsvqFms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802235; c=relaxed/simple;
	bh=nOPgqH4lhiAM4OWu/qIJGrbWH9VXRKT7m22Jc/D4Ss8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=db9bzwoXZIKL52KSwgmNvMWZhPMd0feIMB53uRRVAcegRcsSxefo4T9FBiGnMnx9KHWlxtyRXrfUw0AyZZrDSpfk4hWwWwzFuj1Ud5CuWECtFRkQz3iK85FC+N99s501Jk2H4Yxene8/k7CQvnCJxg6qVQcF5sEIterGwn4of6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=stmo4099; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f0b5d6c6eso5170715ad.0
        for <linux-omap@vger.kernel.org>; Wed, 05 Feb 2025 16:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802233; x=1739407033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zzIHkh0JWr0k+Vy4PcXdrqiu6lb1v5EsnhvqxVQ3do=;
        b=stmo4099NOPLysGubhkrcLBFWWz5loMEr2psuQsrLJFll/4G6Yw2LVU6Tbq9kZ1glJ
         OLn0Je9TBN9mPkdDbBkDpbE3G5rFDekXpBlTyseSrysNGnknzRGJOJDAgv/Rd/Lsh5VR
         1hkr5shDvjeLqQaBN/eTFhK4sHPEqxn3W/ddij7ZQ519fCJuhOnR/Iy0wBeTFV5VFZpv
         5JTYwQ/hIiuMnENyM3JLRwcotNnKANDmHsKGZoYsSmgG5NyiVV7YEUuEpDRsC2BSkt3U
         qqrVN1Mt822M51HWAcwzjqeSsfpXiuZwVtVTQB2Uv4DaYy8zeNH/Enpjou3CJxuiOyVB
         Qo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802233; x=1739407033;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zzIHkh0JWr0k+Vy4PcXdrqiu6lb1v5EsnhvqxVQ3do=;
        b=XTuFxF11Wb+s/GEAB4n65/3xCucV02cqla/iFG4pt2Sq7h6DxfUHSXWd5gBgL/C/nu
         DlLl3b33qQ1HFnJewVZbvTpDujy9GaqJJkRHx+c9b808bd3oaJOd46wEAtlOE1KDN6z0
         H7wKIlpnskN8zNMVaJ+jImgk+GxcKK558TqHL19VzD13qnbm2ncjsn+JK+Exy7VkIyBI
         afw8Iv4MJGonJOIHQ9dc7Z04mA6Z21o6HZQSlbiU6Rwx2B17XYKunp25SAfwZ/dDODsk
         +wltE0nZPnZwZrqRQCtQ1fTl33EggcEQ+FWYGl+VxOv02LsS1RaA00YBd2lZRF1aZuZJ
         QXIA==
X-Forwarded-Encrypted: i=1; AJvYcCUsAn6ZD8QY3wrunwjmvfPMX8OQtJwLYYkF93kgkPRHV+c9iE28urWu3dAmCVUt/aLroRkX7V1Hlwj8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7R1KIQbHuvV6Q41SOg02w1BOZIPst7I5Jh+IqosRPpw86QlwB
	X6/woFW2rFXdHQCi+32KLzSGToUJZ4iCyjXZtDR5xTz1rfiRribSky7HGFYQPcc=
X-Gm-Gg: ASbGncvyThXyhMXFXLaU92a6rIkX9esoyi2dhKFNrfkq4eEzk9aCD8qsmqpbBZZ8OIJ
	VIzGObNT6cJc2hse2uVvgmPVFp1Hui63nTPen34WdB6aFVpTAJ4z/5EecU9D5l4qJf2dPpfAlK3
	BCIp+O8eQ1w6cO+IXjNv63ThlnmhRGVRy+xInWQpu0fZtqupkagwVFMI2afYuK8zf+Fm4EHjDMi
	G3D9dSPeP+B3GpFjCRb3X03vfHQcoMVFcUZ+6dHaPcQCFpaHGEhiZhtjwnpQH6dt360PYuc5uqK
	//0TyrubauhRSg==
X-Google-Smtp-Source: AGHT+IHeAALMMN6rEjNsIcgDHE6izQCRHL2t1ia7J5PPMNZzXVn0e++b281jLiI3GTn7lM9t/PY1+w==
X-Received: by 2002:a17:902:e809:b0:215:b1e3:c051 with SMTP id d9443c01a7336-21f2f173840mr22559485ad.11.1738802233665;
        Wed, 05 Feb 2025 16:37:13 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d8desm49515ad.155.2025.02.05.16.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:13 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-kernel@vger.kernel.org, Tom Rini <trini@konsulko.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Robert Nelson <robertcnelson@gmail.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20250123174901.1182176-1-trini@konsulko.com>
References: <20250123174901.1182176-1-trini@konsulko.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: omap: Add TI Pandaboard A4 variant
Message-Id: <173880223301.2488567.10858467099491839208.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:13 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Thu, 23 Jan 2025 11:49:00 -0600, Tom Rini wrote:
> Document the ti,omap4-panda-a4 compatible string in the appropriate
> place within the omap family binding file.
> 
> 

Applied, thanks!

[1/2] dt-bindings: omap: Add TI Pandaboard A4 variant
      commit: a4ec13e6101ea750b17dc23f49f21d3f57623099
[2/2] ARM: dts: omap4-panda-a4: Add missing model and compatible properties
      commit: ea07a4775df03852c353514b5b7646a17bd425be

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


