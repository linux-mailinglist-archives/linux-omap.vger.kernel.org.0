Return-Path: <linux-omap+bounces-3690-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE53AB29A1
	for <lists+linux-omap@lfdr.de>; Sun, 11 May 2025 18:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CDE6174BED
	for <lists+linux-omap@lfdr.de>; Sun, 11 May 2025 16:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A104525C835;
	Sun, 11 May 2025 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Q+ig6TGF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80E25C812
	for <linux-omap@vger.kernel.org>; Sun, 11 May 2025 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981579; cv=none; b=IW1nN7SwiMKvofoFDnOAmUqXroorgBF8sa1W1Iq5K5p1hyJg4O0xX00H8IJDz4+AFC0YlJSTem6LIRNqtHKFRKyZr6KHFa5lGaq1XJ1nxxyX/EV0TxiM+l6A/XV6iGRY+e5w5/rEbgYj6WwSvMJoEiRD/DGtwbHq2unseYS4OO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981579; c=relaxed/simple;
	bh=86EcoohZdp16Ev33iMEvnc2MOkgdGrvGGRvhH7b3g04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PNij1EpRI851W5PLRo8uuDhPiX1gzpQdBcYAXpN0TXX+9MuRFgkUSI6vS42Bc8MzLEL37HWd0XvXoJvVXhMijNJ/evsj5TL20oNhdr80ZHZ6DhBVrF3zzWnGX2QrrYZnMywgy0YeLIN39QZjfPAM9Mt8nIedpttaNrlRKZw9RDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Q+ig6TGF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7398d65476eso3018260b3a.1
        for <linux-omap@vger.kernel.org>; Sun, 11 May 2025 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746981575; x=1747586375; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MI3xhS9GS2tTohqa0CAozCWCbtZPg+ltklfeiJnzIyU=;
        b=Q+ig6TGF5r7ex3lkOGwA4olSARahcKT7D2FbgHzY6Jzrdc0RHSC0Z+ygrugf1iXyk7
         FTBOus6I3Dyhaq5N4rtUG/MGuFsqeWdojgQNzkbntN3O1NNxopZD4/K1jtS8/aFzM0hl
         4nbOlN/IRTPTqpxmk1ZOhGYSoybxmDaR7pY9oBsW3TdczkzuknPWOfbWb3ZItITj353I
         0jHByQnr3TRZ1Vm7hM8tJP4POkPwRDB+FKxocUExs5JidSi8A/nC9CvoX00WzCQxqPrP
         NtYKXr9FX/dJMM96ZGQoYe8rOLLGoIGD9PUcYTWtnmJe/KB7IWR2SxbCqitPb4HwlA4O
         6rtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746981575; x=1747586375;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MI3xhS9GS2tTohqa0CAozCWCbtZPg+ltklfeiJnzIyU=;
        b=vAsZJmr0HTqvWvGnVUryjZf3vHqiah5oE0v33MZB9b21ljaPLi4Zj9gdhUfkYyoJ0K
         zh9cZwTOPk/Di+8sMyyPtlLZpRDEghngW77e96P8E0xdc7T9+MNE+rbH+NmD2dQxIgc7
         rcDXSNcWQJUfe4p1rutu0ZR9eKXENe04q4BWDXMz7Sg2tNb7RKWeLS6iirIPL/grXoUV
         1Mr8tufd/XhoaxwQYEkP1jQaFjVYnxJfPxM8b/vJ/WQ976JSxWgXTzGTIx3aoXJX0S2q
         1c5RYvBgiSP8z1yYeqv2020g9jkRtI/YwsXpJsWiN7qCWfip9EX8/twzhpskEwk1V8TP
         NvCA==
X-Gm-Message-State: AOJu0Yy2w2UZGgzdiR5VksEpe0add9c0mlJEqefO9ksW0X8+k0GyUsoH
	WOUO4I1I33nI3/RBHGICKKmoY9lYks0StvmOB8DH6oS6r4+tglc5iX3MBEjcx7w=
X-Gm-Gg: ASbGncvMJAQLPcg+B87PYnQHGGgeZ3+gHfeZmivyKNmXU4X484quUC20mo74nrDRQC2
	NDvjtcS6lnbZB7ZivC9LsEdg5tlxWB8xHsu+nTtqztBdZ9JsjtWgWG2gLw/EZou66zA9+KB1myh
	f+5bha6Y5AqpT4QG1qe/2ELm++TbYHi2oDahP0gpnjq5I9njrdiCBKLcO8dM7B1GIoQUhg/rEXu
	ROmR+cR8mXCdmGtMHDf0iIRwePWh51pqZNoHYGRvO0ZIFWOV8eUCMcLoc2SiGzQNwYQ33oVC/Sq
	m22a/vfm9kpDjCKSEBNxHoKO6ldCfcB7FcIHt9o3PnBXm+DoYg==
X-Google-Smtp-Source: AGHT+IGLUaG3Kp3A5MVdotDg8riD1h1SCHLByx+6hUPHW+1j7xd73QRVyp0W55nwlfqH9cNKJFtzkA==
X-Received: by 2002:a05:6a20:d80a:b0:1f0:e2d0:fb65 with SMTP id adf61e73a8af0-215ab4ab9fbmr15814197637.2.1746981575693;
        Sun, 11 May 2025 09:39:35 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8efa2sm4621595b3a.165.2025.05.11.09.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:39:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] OMAP driver updates for v6.16
Date: Sun, 11 May 2025 09:39:34 -0700
Message-ID: <7h5xi7rtix.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.16/drivers-signed

for you to fetch changes up to 36305857b1ead8f6ca033a913162ebc09bee0b43:

  Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first" (2025-04-10 17:35:50 -0700)

----------------------------------------------------------------
OMAP driver updates for v6.16

----------------------------------------------------------------
Alexander Sverdlin (1):
      Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first"

 drivers/bus/ti-sysc.c | 49 -------------------------------------------------
 1 file changed, 49 deletions(-)

