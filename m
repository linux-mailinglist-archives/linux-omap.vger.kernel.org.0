Return-Path: <linux-omap+bounces-4922-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C468AC6584C
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 18:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 442844EE19F
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 17:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E592FBDED;
	Mon, 17 Nov 2025 17:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XU8AGYmb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AE82D12EF
	for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400427; cv=none; b=i+laRzK7kmfc4vruuWCbp1XaWUJEBUA4sPentbOPiopZ71zjqjSXipc00waIN3XXyF/4hW03Tt+MfQZs8S1g7tqSg9GjYvPtD1BeYOsVZJ2TWT7XhKNay6QMDWP0MYawV5pnU1ZNwVDwVHDZY5fIiF4pZ0OLbgBMASt51WmA9B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400427; c=relaxed/simple;
	bh=e+A06of/5QsUNeIsn58UZBUaJZQdKa6DKys4F7BcAJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MM7HEab2RAWGKrWxdHXZNyhz2RGfS0DtOk8eVSuqb9BxXBDSrhYG53uvFUuiNliLUXDCwY0+G4GVQermTVL9I5i6TA9h7i9fDBFykquGInFLUz+pjJb68F7OHoDPfwBIamjd8w3uHSYcMImeBrLLJTEWZ8fgOwIk1VDvsWji3P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XU8AGYmb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297ec50477aso33022765ad.1
        for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 09:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400424; x=1764005224; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6rbKBgmKTQtWUUeEbXSUWDvuJjTtNqK/XhptsEjZldg=;
        b=XU8AGYmbQnV2QG4lejsJ/MjnnRE0mwKLpN1wpAvIuGtb4xtFshT8Ry1vLXyI8tn4Vs
         jxPSwS6M/jE6PHIDdg7cdCoIS8FwHXBo7SmuuD2KKm45o1NGUyHFLR2ZvGCZn/76rDRx
         +RfuexsLRrpm593CW1czpF9L7tLVvWo6+eiPzAjuvDt78Ro+fS8A6NGSg608emkqFYOf
         zp70x4yfRmKeEDTHMkCgLtTzOpjLJ6jdKeih62S/sNmQ096cBWBdyhv+4NvSgCtmYqkl
         KjgfGsUlCMnGEizJDQi8NU2Hdjb//8FAkA/zH8vuOuQf16qEosfxBYA6plXCaj6jlK4Y
         IsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400424; x=1764005224;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rbKBgmKTQtWUUeEbXSUWDvuJjTtNqK/XhptsEjZldg=;
        b=ESgQdtX+z6n+/gazUu9eeQbMXvHmRCU0o/lfQULjtfgWo+Z8mffSSet4A/bJELY4Ya
         Mftc8b2uzpy2yTO0BWjT3CuANCBxWw1KWBl1pGTMXuZdTkPXQSgIMB8KgSzFgwG4ld+A
         L7XvVQ+YamkPforsPEOKe00dom8qZtNxdBR+XmdDba7xOYo7Z+YwoiohBtVjmJUOjdM9
         QowOeXhB+mQwdPb31/kKz9OcpqxijNyJfNffTbJQH+/Bg6CtgwIKqLu2lN+baRbGT/JI
         OeBtYOHppudjFiQxYmPqjhRLOUDFyp+9ArnfSEtr1RqtK6Iy8tVXHKfImIFwrCBCOIIa
         ngyQ==
X-Gm-Message-State: AOJu0YwvcstHS63mrgN2n53KMqzvYxwACblRoKKJ0hbhVkaOfeVQ8uBL
	HE2ptRJQdjFZSLaczz/l7BR8ZNpP5R5alNXo8ZLCDjTtIbzp5vD6oj2RHZ10dorTu48=
X-Gm-Gg: ASbGncuwh1a+W3toxqdP/8wvbv+dGERRA0FsyJreeTSrU1kWtu420lJgthiKQMLaFis
	uX3KIJmqpT7DH9GQ7wsXnLjNtpIRZ+wjaN/LhLcilBHtPb5j/RakIE5w8k7Ab6YFRJJ49ia8NL2
	uOvqTFQ59QfVoKwhqYCtXsWjjauITCs9Y0bwiGToLFNaT1762Y8SVxLVe9Ei7jWv1G5IF8VxHCB
	Ve7Xf3iz+OfuYGoAKERbRrnN50VwOiilxlso0JfcLTHbQxwml8Do51TEtvEgG6ZH2ndRC9GbSza
	TgEsZmRhlexMTRQwfbYmJlzB1BSBYJHC3KU8HQERJS16xRRm8iYWHy8vW3U5MAHQubfIY45DULj
	zC+d1ovASA+8mrM2UWVrTKmCwPZz56dsjgNdPL6cSw5uIw++EQyTw+58afTZWqCJzbqzS74XUWg
	==
X-Google-Smtp-Source: AGHT+IFA0UUsyMIJqov1zn7h2UMQsI01nWNIxprKp+P66lGVB1wQy6f1ak+AtImwdL+V+x6WJmuOzQ==
X-Received: by 2002:a17:903:191:b0:294:fc13:7e8c with SMTP id d9443c01a7336-299f552c33emr1059985ad.13.1763400424299;
        Mon, 17 Nov 2025 09:27:04 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29864b00fc9sm121055215ad.40.2025.11.17.09.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:27:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: omap: updates for v6.19
Date: Mon, 17 Nov 2025 09:27:03 -0800
Message-ID: <7h7bvolgd4.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/soc-signed

for you to fetch changes up to ae18c465b3ae0879a023b4a89c032064afb78234:

  ARM: OMAP2+: Fix falg->flag typo in omap_smc2() (2025-11-04 14:47:46 -0800)

----------------------------------------------------------------
ARM: OMAP2+: Fix falg->flag typo in omap_smc2()

----------------------------------------------------------------
Ali Khan (1):
      ARM: OMAP2+: Fix falg->flag typo in omap_smc2()

 arch/arm/mach-omap2/omap-secure.h | 2 +-
 arch/arm/mach-omap2/omap-smc.S    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

