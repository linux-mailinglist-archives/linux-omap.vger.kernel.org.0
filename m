Return-Path: <linux-omap+bounces-302-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B448782FE2D
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jan 2024 02:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62D0428778C
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jan 2024 01:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929A7210A;
	Wed, 17 Jan 2024 01:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QRCPXq+3"
X-Original-To: linux-omap@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8E1385;
	Wed, 17 Jan 2024 01:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705453808; cv=none; b=tHXCaOW+1smJgRpwOQ7dQ65s3jqi1TJNYAbrcAHLaTQEtC2uTemi0/htcOZXQjPWP1lCUGLOxm4+T4/AIi0csVjdvKxTephLlL10WYTmYLSpwTXOyhxrfIT42OJ5j0zXcNKMigDNmhBBro2fmi67OgqTY7OISKn5bTmaYVy32eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705453808; c=relaxed/simple;
	bh=clZBqQ02r/6ZEfBAlGdIaFRLscyEwF/D28yNWD4RkBk=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding; b=pDS7m/dTlaj+ctsRBbfHlJ6XAbAjX/ZAb7VdfdwxY0rrBfJI9872sMISELyQC0J8/iIAf5btygspt1bPDiUKgKHE+B5s5XDZcOxDH/nboRbwua82+vHDwb3325tgD28ZEeGCL6VXs9tHrWsvQGhEwWHnVnGkWDiEr2DsH+UNyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QRCPXq+3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=clZBqQ02r/6ZEfBAlGdIaFRLscyEwF/D28yNWD4RkBk=; b=QRCPXq+30XTFBS/gSpMVTeuP5q
	CFIjEAxMm5cxxyj5O0SEiH0nUtsFA4is6vFM0HhmQpNVPQ9FGtB1naC64TMSpVtqtiQiF4SHjdAfP
	sfoBSXG+fwqDMXREceunvQOJoFxfU7WYCp5BlSV/ixqHQHCbPTxGyGkS4upohwYYqMWj9PK4pdx1k
	VDXJtsesKqkNjILpC9xtH+Ts61yF6hLNlpvOPY93bFVYMqg9DRmtGjJ72yLCihfCkg7/WXzCB9pTf
	f8g5aRRlcNydosy+y5SLM2pPk8DdJT8jkKjhZZWoKmrl9e4DTuUUKcvg/h5bJXjUJmAAlM6Isgq63
	QEIxVEWQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rPuRR-00E6zu-1y;
	Wed, 17 Jan 2024 01:10:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	patches@armlinux.org.uk,
	Paul Walmsley <paul@pwsan.com>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Kevin Hilman <khilman@kernel.org>
Subject: [PATCH 00/13] ARM: OMAP2+: fix a bunch of kernel-doc warnings
Date: Tue, 16 Jan 2024 17:09:48 -0800
Message-ID: <20240117011004.22669-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix many kernel-doc warnings in arch/arm/mach-omap2/:

 [PATCH 01/13] ARM: OMAP2+: am33xx-restart: fix function name in kernel-doc
 [PATCH 02/13] ARM: OMAP2+: clockdomain: fix kernel-doc warnings
 [PATCH 03/13] ARM: OMAP2+: clock: fix a function name in kernel-doc
 [PATCH 04/13] ARM: OMAP2+: cm33xx: use matching function name in kernel-doc
 [PATCH 05/13] ARM: OMAP2+: CMINST: use matching function name in kernel-doc
 [PATCH 06/13] ARM: OMAP2+: hwmod: remove misuse of kernel-doc
 [PATCH 07/13] ARM: OMAP2+: hwmod: fix kernel-doc warnings
 [PATCH 08/13] ARM: OMAP2+: pmic-cpcap: fix kernel-doc warnings
 [PATCH 09/13] ARM: OMAP2+: prm44xx: fix a kernel-doc warning
 [PATCH 10/13] ARM: OMAP2+: PRM: fix kernel-doc warnings
 [PATCH 11/13] ARM: OMAP2+: fix a kernel-doc warning
 [PATCH 12/13] ARM: OMAP2+: fix kernel-doc warnings
 [PATCH 13/13] ARM: OMAP2+: fix kernel-doc warnings

Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: patches@armlinux.org.uk
Cc: Paul Walmsley <paul@pwsan.com>
Cc: "Benoît Cousson" <bcousson@baylibre.com>
Cc: Kevin Hilman <khilman@kernel.org>

