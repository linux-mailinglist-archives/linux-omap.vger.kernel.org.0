Return-Path: <linux-omap+bounces-153-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F97380A309
	for <lists+linux-omap@lfdr.de>; Fri,  8 Dec 2023 13:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2003BB20BE0
	for <lists+linux-omap@lfdr.de>; Fri,  8 Dec 2023 12:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDA41C293;
	Fri,  8 Dec 2023 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="FJRhI9Dv"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFF91994
	for <linux-omap@vger.kernel.org>; Fri,  8 Dec 2023 04:19:02 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 52C0A60500;
	Fri,  8 Dec 2023 12:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1702037941;
	bh=X1f9u7h9Lfj89wa/zo8Wd+9hqQPSaXfArC7mNIyIqnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJRhI9DvY8OmjAPzwFoqm/dCeDgIzxozcKihwilTnE89isDRbIEkAQvGi8LLiEo66
	 0R3Z1w9FycF1PeQku0k98Dw5j6AJ/8LhaDhhit0Ig5rsRTFuMdIYv+INLbJ4Nxt8Zo
	 AePBOpBsDoRGyvz/ZGo0vtQRzqhTTYrbXknaXCpr6hq4XdwvY7Ejws02igAMAQ7AW2
	 RJoxebKxjSu2RTSjYFG/cQQOJNA9ae73B1H4G9FDZiN4Wd9roDF9vw4vH45W9i8Mb9
	 +Vn6mlX7fnElRZ1iMyaOEEe8yeM2jB+8IX6/zQz0voCLQlzFxf2+rQLEySIomdeG7B
	 AWqSoKjkuVkbA==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Maintainer changes for v6.8
Date: Fri,  8 Dec 2023 14:18:19 +0200
Message-ID: <pull-1702037869-295608@atomide.com-3>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <pull-1702037869-295608@atomide.com>
References: <pull-1702037869-295608@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.8/maintainers-signed

for you to fetch changes up to 6353ed6f311b9daab93df4d968d72ddf2070fe7f:

  MAINTAINERS: add omap bus drivers to OMAP2+ SUPPORT (2023-12-01 08:49:45 +0200)

----------------------------------------------------------------
Maintainer update for drivers/bus/omap* files

Add for drivers/bus/omap* files to the omap section in the
MAINTAINERS file.

----------------------------------------------------------------
Lukas Bulwahn (1):
      MAINTAINERS: add omap bus drivers to OMAP2+ SUPPORT

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

