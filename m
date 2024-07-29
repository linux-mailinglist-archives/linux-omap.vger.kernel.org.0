Return-Path: <linux-omap+bounces-1797-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD793FEE8
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2024 22:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66B751C21456
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2024 20:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785D61891C3;
	Mon, 29 Jul 2024 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ec/kvGuD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539CA188CAD
	for <linux-omap@vger.kernel.org>; Mon, 29 Jul 2024 20:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722284082; cv=none; b=opMhJW+3U8jRem4jV1eRQEXbr1osMhcYbZ8RhDB68Z7HZWaxuQd7DiaTt2Izz59pg2c+PCmG8LV4YDvnsWmZ7fFOsgZA2aaomqcd96bYXmU+Ws86mVW8xtH1AnA8Hcqj/DbnCNvD70Z5qgpZC5DVVFnjS2FlJHCfU8Zv9i3WHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722284082; c=relaxed/simple;
	bh=dJ28NjyFB37oj+Vsmv6ytIr7UsvU2srB/xlfAVWjfUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n8ljq3v3tXcCx/8LyAJ6/omhemuDiYo9xtbPyil2p7IXdd0VPUe2R0VVocnQB+0r8GMgdDqkc0ydRh0uM84YJGOEu96fFvb0CIcfsHDhmXb9IPNTVzwXA6DwmH2RN81kRcVxPy71jwzCDiCU90TKIt7GzkIAWHnBXp4yeyM6XPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ec/kvGuD; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7a115c427f1so2203292a12.0
        for <linux-omap@vger.kernel.org>; Mon, 29 Jul 2024 13:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722284078; x=1722888878; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zHaXs9IaJwVlX7b7czEyrMn4y+6Jb7XfSHnsQq41kc8=;
        b=ec/kvGuDAVs4O63TG7NuyzSXx9ohULfsmdFtxR3cAn72KsErJ7+hn19cdI0AGjQBqi
         HomDs6ND7B9TnxLpCDV+rdo0z8N+tF4cY0j3YRszJGs+R/m249VyTLAf7CksW1hutrXp
         I/NNX4Ezgh1fc5oJ7kGxK6y2THXiVZ+ADa3RCX62S9TWahvt1EnmG7vKwZyYTvo/cRgd
         1fBK1q1jJlY14Z/w/K4rtZb/rDfwxt7HNC3fvs7Q5qP3nJZZNq3J4wkQ5nGMS41h1uoQ
         XyYKpbIEDhtXXxbRPNkxbI70wptOo96o9yViXjspfBof/gmk9F2BadzWRnqUmRoA0sxC
         QCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722284078; x=1722888878;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHaXs9IaJwVlX7b7czEyrMn4y+6Jb7XfSHnsQq41kc8=;
        b=nsUb/xpBHt8GupDPoPY4GF1UpUna/dWTDqCUpyXtdbJeSEwJfQDtlRfy2ni53d8vOW
         EjI00OeX3DAGHNRQpW1uupPvw7/FO0o+3guhWGF9XuqcngiTY6NApFSJ5hPzdgPtA0Ez
         0aWZVadm2v53A5SswydDwtMQKF1wzf4QkPGEa9GtMtDcmtMjTqQ0OMQ6J9R/UqUdpHuy
         scBG9smRy/uARAy1QFUg4wlImqyn+8s+12NuHqzeCK/B6VN4t+TcHYQgzzxtDFvRLDiV
         pZ1wqB+m2qa8VQv+MURibe342Qukwc16QV5rx8/eGCUIAdrQzzOc1mVyej2fn5Cw5MwK
         olMw==
X-Forwarded-Encrypted: i=1; AJvYcCXrXqClX4v/eUsPeUYYjTzRWdzEmDYHU5x++ICJNVjwJ8smPhTA7QXhGAWTwhT96hi0P6SuQ7Y0LOKbE0MJGX5jQL+ZrjA9Wd8Ngw==
X-Gm-Message-State: AOJu0YxkAyITYt++I4sz7dH5su4sD2ZmdRn/J52HUDk9JMfZBFTQdV+c
	Qt319pa9e7LQtiSFN/9OkwNyN18RO5AWoPYDVxeiskjv/8GbbDJVcQRrRQj20C8UsOCeU1U7NKu
	s
X-Google-Smtp-Source: AGHT+IGZu1RsYz5WQuQOkchkfyHIBK1SwHFr3a42HXBfHfg8h9eXck010LKLIx5OsjR2POqu9E+8LQ==
X-Received: by 2002:a05:6a20:6f8e:b0:1c4:2134:dd52 with SMTP id adf61e73a8af0-1c4a11803e9mr7999162637.3.1722284078392;
        Mon, 29 Jul 2024 13:14:38 -0700 (PDT)
Received: from localhost (75-172-120-197.tukw.qwest.net. [75.172.120.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8a3318sm7201362b3a.201.2024.07.29.13.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:14:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Dominik Haller <d.haller@phytec.de>, tony@atomide.com,
 s.hemer@phytec.de, linux-omap@vger.kernel.org
Cc: upstream@phytec.de, d.haller@phytec.de
Subject: Re: [PATCH 1/2] ARM: dts: ti: omap: am335x-regor: Fix RS485 settings
In-Reply-To: <20240725141952.81213-1-d.haller@phytec.de>
References: <20240725141952.81213-1-d.haller@phytec.de>
Date: Mon, 29 Jul 2024 13:14:37 -0700
Message-ID: <7hbk2g3qhe.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dominik Haller <d.haller@phytec.de> writes:

> From: Steffen Hemer <s.hemer@phytec.de>
>
> RTS pin seems to have inverted behavior on am335x, other than expected
> with default "rs485-rts-active-high" (instead of low on idle, high on send,
> it is the opposite). Transceiver datasheet also suggests a pulldown.
> Add includes to pin definitions that are used.
>
> Signed-off-by: Steffen Hemer <s.hemer@phytec.de>

Series LGTM, but as the sender, we need your Signed-off-by here too.
See the docs on submitting patches for all the details[1].

Kevin

[1]  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

