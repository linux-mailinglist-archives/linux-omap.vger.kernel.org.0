Return-Path: <linux-omap+bounces-3026-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151BA04D80
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 00:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D54E7A2878
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 23:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E34F1E5729;
	Tue,  7 Jan 2025 23:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZilWOCta"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D95194A45
	for <linux-omap@vger.kernel.org>; Tue,  7 Jan 2025 23:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292408; cv=none; b=P/aUouyeLJKzepmYDKlzTFFTD8HTHcjHtk/y3VfX7qlz2zDG81BEacoIVSIUTcprFUcCkiPsvw/5kMm7rLotxQHigw2JMcTQXROwWt+Gul3xQKPsperLEqME9scixN5j3+iTpTc0dZ92TVGh+yQsJZIExOFFrMFJ0gmDg8oFCyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292408; c=relaxed/simple;
	bh=70NJicN4lkWN0R/+p/7ByCJUNzbiu8Ks9I2Mhg8PY4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XYpHGVtTzXn8PZu+rk4mat4vI5KTOGWBoQ1rRt1iJpGtOACXkYT0MTJ1RLfU+1R+FBvbP3VmNzeAS6ApKe2Cd7XYyjawCH7olAULqlO1pYN2a6X5/uIjQC43xm3+3b3TY85Jw744Bz1G0Hm5HjU8Qs7ntaQgsKWcIKSQ3Edvo9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZilWOCta; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso23679303a91.0
        for <linux-omap@vger.kernel.org>; Tue, 07 Jan 2025 15:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736292406; x=1736897206; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2QDdyedWsqG+v2AZi3H9QCS2GE53jTZNmzxpEDi/sDw=;
        b=ZilWOCtanNQGgzAcgg99Mtjt81VEvQ65X/7NlNqS/3j+tCMSNpwdf5qHZ8z/dbdbNn
         im1D14hGtKZk33ADR6R2tctl5yMlmYBo1HowgbYHoAFTdHd7pk2/XEqhGFxCu++OVjyE
         Qri6bdqsz6hs+RkF44l+DeI5w67uW6/70KX/+ucjSiWUdWwkeP+qr0cVnLoMNNCS4XyO
         MvYRWIsheSruK7nHNEy1aPiHsjr3RhJDZYXxNc42CUBZl1K3JJ3luuFEIrGU2j5+6TGv
         1+NenVKCu3msPFcEgajLFbwYtMWaiVj8Diy+m7efAqUdMtjPPzVPpDt3r/APzoDzUYaJ
         OAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736292406; x=1736897206;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QDdyedWsqG+v2AZi3H9QCS2GE53jTZNmzxpEDi/sDw=;
        b=NBCU0f0qWWyIKOOAS49IHobSfZLj3q5YQjFfh9kVZk3t6qMzQ7LF2ZDRQsk87t2v3K
         AYGzC0T6puyoA6cClhdbEBDpxLg0+Hf9rFrVSU3NHsuk5Prs0i2F1d7PxYSW6HZIx1fJ
         HkSULGyrvkYKeUwDw9u578CXhC2m03bsJu7iMz/tsXEeuWK3GpLIjAlMzo2Juev/f15n
         WN7JAmgeXAQbvQ2CzJLGq5SCYjpS/RnVVDkU/n7gxwkndoO1nx78lnuEMdSpjuFiuVoq
         QUF+melcou1+ztWc2xPN5HdW5r10pDKEPk0oQXWUtxH3Cks3ArijXYD6jhN2tDgfUxXP
         wNJg==
X-Gm-Message-State: AOJu0YyOaHLAxJYd+/qJSzQ8qPpwdfeS0bQYgk6+Fa1ocXG6Ok84vEcn
	0QQ94Rftb7+JhzEm5zDgXzE0O31xUjEWuosrjesYQ6u0vQHX3+Fscp9x7RiSQp8=
X-Gm-Gg: ASbGncsp33n69B4OF8gOBsxZM+4Eqmgn5gJPfKIiKo+HcAEpcHOcb9uV0hvETjOdtYf
	v8btsq1Z+BrqSrC6GOcqyTlPh4LHJom5Y5y/MUOqlW08ndjTbb88V/bwHS51SenK/Wrd44v9w3l
	e0GmyjmMdrkVr3WS7DYTKEK/qJeCbh/eQRv5efp+IO3oU8+0xcCY77gic2llE9H1Ma5EgeN/zlp
	JHA33W+KBzfD14ENlm5ZKfYNi3d8FBuEknDImbmcjq8JZDn+DrqzmA=
X-Google-Smtp-Source: AGHT+IEkqXBuXNblGZ518IQhUFeptLk1bmMCSYZHXrxvLRxYePl8DdoRBjuLuVKBAlEE9rwoMDaFyg==
X-Received: by 2002:a17:90b:2d44:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-2f548eceda2mr957257a91.21.1736292405710;
        Tue, 07 Jan 2025 15:26:45 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a26acc3sm87438a91.4.2025.01.07.15.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:26:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm/omap: drivers: updates for v6.14
Date: Tue, 07 Jan 2025 15:26:45 -0800
Message-ID: <7hcygyb3yi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/drivers-signed

for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:

  Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)

----------------------------------------------------------------
arm/omap: drivers: updates for v6.14

----------------------------------------------------------------
Andreas Kemnade (1):
      Input: tsc2007 - accept standard properties

 drivers/input/touchscreen/tsc2007.h      | 2 ++
 drivers/input/touchscreen/tsc2007_core.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

