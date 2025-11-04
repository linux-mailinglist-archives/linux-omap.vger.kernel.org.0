Return-Path: <linux-omap+bounces-4840-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98930C33544
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A02944F0157
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4862831A564;
	Tue,  4 Nov 2025 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ay2+oeJg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8DA2D3A80
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297616; cv=none; b=HvLT1Bg00sk1YxrIil+bxUBAwCfRRPGrrWFValsMsjIxBTJdRYCOUt37MKqewy+h05y0f6NGX+MkIaPnbNPraoDcj6XcLBvsFqYfEelqaPUEuK3zRjsF+7EgQdKWAniFDWC/U0t7uJJ05HG8it/7etErYwcNTJIpoksct+31L9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297616; c=relaxed/simple;
	bh=fchhTn8MqJxLmfbqVXq6GZ7RtHLl+u227s4dumCWLq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oxRmW2MK9n5dElGvblSZDX5qqCzCqSRjlkDgBfUs4K8kU7civU360PXIzpfnTSk/S++fEB2Qu7449GEooPhvREFnwJk8Ti078x4qtj1yuOEvy0HsgQ+X7NqYgO9re1Npv5SaKNTR3/Ub+66AhhUfCbc3A+X8gJRcHOr6H/cULdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ay2+oeJg; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ba488b064cbso512981a12.1
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297614; x=1762902414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhlsviKHKhZuRlG/mtBhAql/+W3DM4TdZaLX7tyx7hw=;
        b=ay2+oeJgu77oqtDOGpf6cvP9dGbEzxwCDqNq2WcyPNRvJuH7XNSRJ2DWFVYPn2sNa8
         SR1TKw8bCQx+yd6zb8OT0VQPyEBBqZBttvn+Q1zpavpFAXuhCHp6UC2CNqKRLS+nhV8a
         RKlZSO+PorDv0J44t1Ca7/RTkFM4TTaG6g6k5Mn8pcjPR/J8N+bC4+AW+hg/1h1vkZDt
         10Y4ymh89MwK3J1vfmMAcfVl98ZxH4YlJGUE0DJ1tTEZcsBX3jYSDc3fm07zAg5yeCix
         cWBVlbejAkijBM2G57RMclMDhdIeRhQZBFQSSQxkusA+kBit0pNv250I9uC19awHsxRR
         4BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297614; x=1762902414;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhlsviKHKhZuRlG/mtBhAql/+W3DM4TdZaLX7tyx7hw=;
        b=XEnrhFxvUSligpJ8ApajD0bdnCV03ZkDoeoyqCqdEJi0nPc6slsH6aeVhv134i6/Yo
         MtdN04wEbQwMUAHsrH7Axlb11e0t1TjyodN1j5S7qct+evvBgy9ffPggS8kVwq3SLoEf
         p9HshR/Lsw5rAgprIjvkZK6Q9sPNjKsFiAwpwpK3hhTvSp/Wktt1+hJ1HG7FifQUuCoG
         sV+NwRGyYscdJTeYW1sy0G/IAOp4rjHRWSEiaQDRgxtLE60rgDoTGWXZxavmnpLupjOU
         DCdZy6XXEma0Ih3xy0pxisypd3gLYMbzOVudnnIeIdIwkMwowDFR4GkVyjU6HzfF5MeB
         RU4w==
X-Gm-Message-State: AOJu0Yz8QXDxmHCqq2HGJ1Wf8HkqVvrKusWj0YqYYkGZj/UXrdpxdSId
	7UhiXWjcMtmYjHARJDFMYjyypW7MMTBparInOKMVEMJ3l7snHl/0ZiBWFmgV/UpDwJk=
X-Gm-Gg: ASbGncvpv23qJgCF8qSn09Qe++ZQUJakD6MOVkg3L9Qzdw3UvGP0j7s8X8HRooTp897
	0LxCtrFMKAcjM/xFS7vg3os0dGYucpV36YYBfKFvjFkwuLJ8eJQz98/WnYBYjS1TzHaC+OMreE7
	PrAsmkN2HgD0DbOpx9hv8VIc14odZAj2ayI0xHkg6nN+3V4JaLxW3l8Nc7hIsxnmmzyy8Y4A7MB
	Dmsn7AMTHlG7NvpE8l3yUhc/4ebTfJqp9l8LUlwhyQgxO0xemdRklCt018KtRe0QIejFnmOr0x8
	kXpaPz3zaIiVX8BTZHxCHTcQgorMF47oF99N8/yASZFyan4prbz+AIp/jpDltdukt427lmw8xUc
	lJVdMtFYI0bvSwcLuBIzA5Z6Io+sbgnhLvzIiauWKbb1NOP2qO7xBTgGDcWqhJrsZjkYVz+Jj+5
	sGx2lExBHs
X-Google-Smtp-Source: AGHT+IEjOvXmbX0o+w1OKTng5InpcWCh6Frw8i83U49FZVBly0lrA+TfJV6RE2PP0IrDE9B02Feq7w==
X-Received: by 2002:a05:6a20:258b:b0:340:e2dc:95ae with SMTP id adf61e73a8af0-34f86cfcb5bmr1298282637.42.1762297614275;
        Tue, 04 Nov 2025 15:06:54 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f86b0688sm3520477a12.28.2025.11.04.15.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:06:53 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: devicetree@vger.kernel.org, yegorslists@googlemail.com
Cc: linux-omap@vger.kernel.org, tony@atomide.com, robh@kernel.org
In-Reply-To: <20251007085037.3605676-1-yegorslists@googlemail.com>
References: <20251007085037.3605676-1-yegorslists@googlemail.com>
Subject: Re: [PATCH] ARM: dts: ti: omap: am335x-baltos: add a regulator for
 the mPCIe slot
Message-Id: <176229761350.2840692.17457900842990015670.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:53 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Tue, 07 Oct 2025 10:50:37 +0200, yegorslists@googlemail.com wrote:
> Baltos device provide a mPCIe slot that can be power cycled via a GPIO.
> 
> Add a userspace consumer mpcie-power-switch that references a fixed
> regulator attached to the GPIO3_4.
> 
> 

Applied, thanks!

[1/1] ARM: dts: ti: omap: am335x-baltos: add a regulator for the mPCIe slot
      commit: 473de5d3466f879b84a9d063fa34acdd9e895d76

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


