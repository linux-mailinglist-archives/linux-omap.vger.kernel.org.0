Return-Path: <linux-omap+bounces-1962-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00055959013
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 23:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0CD7283F39
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 21:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9921C6891;
	Tue, 20 Aug 2024 21:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FJ6Ucer5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6C14B097
	for <linux-omap@vger.kernel.org>; Tue, 20 Aug 2024 21:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724191131; cv=none; b=VrJ6xhISEOktvlNj8TJeWVLCmNxydN44qsHq6jxA3TZ7DoWGXLwLmUU/VVks5YVdtOn+4i3DJpeovfrLAZ14tJWgtpDP42lHAk/+z3JrSrtghC4RGGRc2tJp2OZPk8VrhRs6dVg5obiZtrAuePv4akDia+S3viEMVJ8ZaVihKjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724191131; c=relaxed/simple;
	bh=tkcz6IRzNKT5HnHGl49Y+18db5bL8UdCgLL9O1e8MO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=desiuIYgpSMQlospagfwE1rbn8SahrEmbw27ezB/d4SJ4e4/SiqGQk/eCgDH1IKWivHrIJU7gnP0AgbRkXeeUf6AyeJ7tPVr0OoifXYuJKOL3sC1znTEOw9bntMKP/WlZExTX5AlJbIwQG26aR5U5JE6NIabGrghJ3yBUJwk69Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FJ6Ucer5; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3565812a12.2
        for <linux-omap@vger.kernel.org>; Tue, 20 Aug 2024 14:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724191128; x=1724795928; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QEgGWQlUSnnU2Zps1tcbs1WwAWKn9iZ2WAjfctmM1R0=;
        b=FJ6Ucer5fGt2lWfhF+59HB3cQmewjPAuy2gIn3Zy/MK9ojpRa8JFS+/JvLnMvgPOTa
         ZADa8XXq5/PBICxnjsSqnC7kvLVnZTUgWf/Y6WMjQ/mwzqO4dYst+QMIlY2G8Hd6BrTn
         +ZH+M6uiQRY5L3setRLa80mc1NH+3E2/AnZfAZYQUOm/lGKEwCfqBYbd95FccDT/STIH
         tOC2LMBt1MNiHlY0yy7RptRcpsTXXqNDFQGZ222Tm2Z++snVhij+JwEOOm+uXuZwezr2
         OqziQfDwb3Z942iSGKGhLcKt/Addzu8I5Yleeu4hOlVJ0fT1y5XpXNm1bY1sVDhDZTun
         5PPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724191128; x=1724795928;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEgGWQlUSnnU2Zps1tcbs1WwAWKn9iZ2WAjfctmM1R0=;
        b=kwrzYFYFZrIMyk6gKZB9ydHp0vHgKHU1lgsK55CiWjSGsrlLBSqKArRhsDWsmnsEcl
         bsmSYbqLctQ3qCnNg3KOtn193zk66Ssav9qb0X3mI04buW3ahEVA01/zIvR4ew8mgeP4
         q840olXyFZ6j97fPauB8QtZa1DaJvq/ox0ZAlaenGqNEJ7s9LeIrL3sO1nR3+XIeN2Hs
         ++wqNkqBX+vseiDM5iFzEb1R0hJ2/jge6IW2PrbHFQ/O05RgqIgDUASFuJNt/SiFDs1V
         PbHGTmSl3NHnZZWMedSzbZZU2iSz1d9XRwvhi0vs/AjPs4k9kCLF7J9LhbbzvdmCHLQ7
         3ySw==
X-Forwarded-Encrypted: i=1; AJvYcCWcuKLJ33gpgNy/nxCscdmOnAft74t/RvsLCQmCEp0RbWr9OZlkRlZ4uMKW7J5a5Dml+3tyWnH8aJsF@vger.kernel.org
X-Gm-Message-State: AOJu0YyScEvsLcoT6tTwxLExZQPrrysGG09tOrCzIApAeLt5V8sBhtZO
	uot9gW3p/sKhITOWQnrWwmAi4C3Ya7qBKmOb1BLTn1joSjcUEOpaYHe6QtWZL2I=
X-Google-Smtp-Source: AGHT+IHxgAde67vviUGkH8iD44TRlisQATJTZybthdi38Y4uYu1e7xRdwxNjGvFMVp0/Ry8T8TQN8g==
X-Received: by 2002:a05:6a20:b598:b0:1c6:b0cc:c50f with SMTP id adf61e73a8af0-1cad8162296mr801207637.25.1724191127576;
        Tue, 20 Aug 2024 14:58:47 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71420c8f8fdsm341634b3a.146.2024.08.20.14.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 14:58:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [GIT PULL] OMAP fixes for v6.11-rc
Date: Tue, 20 Aug 2024 14:58:46 -0700
Message-ID: <7h4j7eyhyh.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

As discussed here[1], I'll be stepping in to help support on the legacy
OMAP devices, so here's a first pull from me with a fix for the v6.11-rc
cycle.

Please pull,

Kevin

[1] https://lore.kernel.org/all/20240709135930.3405-1-tony@atomide.com/




The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.11/fixes-signed

for you to fetch changes up to 5062d9c0cbbc202e495e9b20f147f64ef5cc2897:

  ARM: dts: omap3-n900: correct the accelerometer orientation (2024-08-05 11:02:39 -0700)

----------------------------------------------------------------
OMAP fixes for v6.11-rc

- omap3-n900: fix accelerometer orientation

----------------------------------------------------------------
Sicelo A. Mhlongo (1):
      ARM: dts: omap3-n900: correct the accelerometer orientation

 arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

