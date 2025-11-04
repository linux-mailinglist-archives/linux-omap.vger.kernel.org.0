Return-Path: <linux-omap+bounces-4848-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBDAC33583
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DCCC04F1BC4
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F90347FC4;
	Tue,  4 Nov 2025 23:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="L+gDBIOj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E0C346FBF
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297624; cv=none; b=lGE6732Rf7u9cPYSQiiubyKzvc2/4Bxe6yu54QcHOfrH8U04R24+BZgqJKDi/VnqAHHQduk1OVpKKKfuXvRWRAxR3cTX3+SCDzNX9J+4opLx1UtGQrGV5VYS9awWPinKudMIfWkrSaSVj3GEV0kf2gR/CU+Osyxp5X9wvnHR3JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297624; c=relaxed/simple;
	bh=zm4ajFWLAvXc6tDsBMzDloo5DMNFuXxBUvESaJIps2U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a9MONCY2LqprbEV+UaTPmqMO87AYXc/cncKJ+0JD8Qka2EKiyd4Qq5G80L7/gG4dl+g/YHzsElePcOCq1hhRl38KFS0R/NCKNsMMkMp6ydm9/JLHm0vOv8dX4Z1FHzC1Xb6a4GshTmNaNP3bOMjZcsoRsNNORXWpt0NGqhkxXyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=L+gDBIOj; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b996c8db896so3194674a12.3
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297622; x=1762902422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z8AC+yiHAIwmarbixp3f4qrcLuRr1Vhyqm82NW6W2M=;
        b=L+gDBIOj6gWlLMXiLUzY/HYxfn8Ooea1+n0ZDytiGZUVEjMNY+JqQ/QTlUoSVMXnUx
         lWYEgO2v1DMn0mM+EbLS0666ooZMUDnYZrOUGi4xL2IvnPrb/PppBZCtd49KEs51KJae
         fhwecyXAPgC7OVAuferGUO2KmpMBOeZd+z8siYGQTdT8o4Gji276cQkzSwHPW/ONvq4x
         RMd1i1y6+JbnoVoNyqQ6K/KXW+Kb0oTiMgHFi2Jpf70ZJ+U0W1ggrKQ7vpE8wD1/NR+S
         CUlW+7zyDNhu/HohaX91UCcFcy/EbBrX0v7RboRistX5rVGWBCRkajNc+MkrMXHrNsV+
         cJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297622; x=1762902422;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7z8AC+yiHAIwmarbixp3f4qrcLuRr1Vhyqm82NW6W2M=;
        b=b4f9ni7sLlDyJ5GRKxm4Pt+I90G9kO5M56pF/z3ArIIrMlup7wUxZxm9iWfz4YYGpp
         IKCQRC1QnPGq7XN3S7YfVIVyr4uvML0HqkVbHw1VeNlbyLALfvCC7vE7lM/o7ni5uDy9
         CJPKTGziRdBgMBZhp5VNZN5BIWmkDl/Xt7gE4Y9fkr2vklr9HeaznPcxL7qzV7Od1mq7
         4YVSjr9G9qZyf7oOR9J7R6bRhdStDYQ5uVjlyy7FAMMuNB74DPC2QFW9od1hMarQ5eRJ
         1kOrwLrqP08G5CeYQTOEFZ0X70HSzmDOiMkdmah/4p3F5I9ZLDDE8azenWjGuKGR4aIS
         f5aw==
X-Gm-Message-State: AOJu0YyZHSoFCdtfigqDutzFnYu4PWfO1FeDY0yHkdZFsMFttmEZiwi3
	v17Tg6K7YEaGh5lWeDKe3PqTFgVtc/N4BYBrO5ENwtf9soijxqbNrEz9H0eDYRiVwmQ=
X-Gm-Gg: ASbGncs3gdGwapLm4rVDG+AkTLSQ6I6nsAm0PIZlxggmq/NeWP8x9tu36oYl/Y0TnhH
	akm0c5/gy47Hvm/3WPGfLk+3PcszESmT2zQQ+eraj9rIREdG6nsfnOOXMhh7wfuerChZa2Qm3Bt
	TuYw6prrfT6ORQlcn/e6fIRSTq6pbXM1pyx/8xdEbzkTXVORADIrwnad0mn1d4vekHaSJThIYoy
	/60TKXHJY3clGKN6hNkG5G93tb870OEWTvQ/rOPW2TqTzYlGr26qCma/KVQ9uLYv7Qrk183mDVO
	UpeZ+1bgUMf3IL4z4DIU0xbhRaZkdsEbOuING/bey7tHVyJi9+tqyri/ZrDoq1UtlEOZDM9kbeN
	NXrYiEXDQo8NhFNKMz9PiaoprF3o9g42CON0bYTMS2TAqgi85kFv0RPSRUoDDDsEjVd/7ZAwYoQ
	==
X-Google-Smtp-Source: AGHT+IEmNKJYP343ceTj40sn2ysBbxZxF2rHm3xoHDdRm81PPZZipomUwb5FT4ZE7dqDQV5SPUTNhQ==
X-Received: by 2002:a05:6a21:32a2:b0:2ff:3752:8375 with SMTP id adf61e73a8af0-34f85f23b25mr1132220637.45.1762297622638;
        Tue, 04 Nov 2025 15:07:02 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd633bf6bsm4132570b3a.56.2025.11.04.15.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:07:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: nm@ti.com, vigneshr@ti.com, aaro.koskinen@iki.fi, andreas@kemnade.info, 
 rogerq@kernel.org, tony@atomide.com, Parvathi Pudi <parvathi@couthit.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, danishanwar@ti.com, pratheesh@ti.com, 
 j-rameshbabu@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com, 
 krishna@couthit.com, mohan@couthit.com, pmohan@couthit.com, 
 basharath@couthit.com
In-Reply-To: <20251103125451.1679404-1-parvathi@couthit.com>
References: <20251103125451.1679404-1-parvathi@couthit.com>
Subject: Re: [RESEND PATCH] ARM: multi_v7_defconfig: Enable TI PRU Ethernet
 driver
Message-Id: <176229762178.2840692.4781785513910576373.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:07:01 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Mon, 03 Nov 2025 18:24:51 +0530, Parvathi Pudi wrote:
> The Programmable Real-time Unit and Industrial Communication Subsystem
> Megabit (ICSSM) is a microcontroller subsystem in TI SoCs such as
> AM57x, AM437x, and AM335x. It provides real-time processing
> capabilities for industrial communication and custom peripheral interfaces.
> 
> Currently, EVMs based on AM57x, AM437x, and AM335x use the ICSSM driver
> for PRU-based Ethernet functionality.
> 
> [...]

Applied, thanks!

[1/1] ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver
      commit: 7d9ebbffc545033897aeb30f2a0a45ead1668bf1

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


