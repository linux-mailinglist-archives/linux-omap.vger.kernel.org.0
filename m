Return-Path: <linux-omap+bounces-871-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61C48775BA
	for <lists+linux-omap@lfdr.de>; Sun, 10 Mar 2024 09:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D96E72831A4
	for <lists+linux-omap@lfdr.de>; Sun, 10 Mar 2024 08:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED8B18C05;
	Sun, 10 Mar 2024 08:06:26 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011617745
	for <linux-omap@vger.kernel.org>; Sun, 10 Mar 2024 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710057986; cv=none; b=Dj3wAjlYWX7QmKLo2eM/Wci70dgPguOtToqekce1kl7RqCXUsRqT53uU0RaSrh1diW+92c/4Y4EaBjQUgIgihdpHyMKSseUq2aJYIaCKP2rGOzZRjsVxkiUmPvDHziRYHZwYX+tMF5pQ/hFsEz8h/WX03FsWI1IdqYEv5hSooc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710057986; c=relaxed/simple;
	bh=6oRLyYOr0K8Fr6EOJdxUdCudAZbuqk+EFlXQ5Gmzn7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uP4TAxeSY1LEkgi8eY5+LbChGqGhSUN/W6CxhsvD7sob1494wQkvPH6BpjwpQRyiqwsK3Aoj6zL0whhZ4bBYFE+fx2WKQC5F98f7i0qScMouirXQzfP5rxI+LJ3W9KtlaozVOrGhKbRFroBk/OtQiBcgf3h4hzviq8amLihUAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjECC-00073P-Vx; Sun, 10 Mar 2024 09:06:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjECB-005Txq-Pp; Sun, 10 Mar 2024 09:06:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjECB-003KQr-2H;
	Sun, 10 Mar 2024 09:06:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Breathitt Gray <william.gray@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Julien Panis <jpanis@baylibre.com>,
	linux-iio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	David Lechner <david@lechnology.com>
Subject: [PATCH 0/2] counter: Convert to platform remove callback returning void
Date: Sun, 10 Mar 2024 09:06:05 +0100
Message-ID: <cover.1710057753.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=6oRLyYOr0K8Fr6EOJdxUdCudAZbuqk+EFlXQ5Gmzn7s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl7Wnup/dsCC3NnmEbHrjLyg2n4oZbjkZkeMS8R 8UFshIAuieJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZe1p7gAKCRCPgPtYfRL+ TtWrCACg60zMWv6NCg+YdADaWbrO42BDBpBcW/+q2pCUPsBBQAeWEtF+LrRoh+4kYQihD3NlRUk znayd/IDcVovSoJ/X7GS2Fj98lu6Hohkci9ufcomkbEIHHK0w5PHl5qbkPOEP00nllU31idQ6/p jeq3/IFhaSo/s21Bh4x4e9SW+k8lx3SqDY1nVWHKUiQb7gEMa2i0Qpp4wuXTfLn84syuJDA2U2b tPbX1BSID7mBmJFHfhXkPPwyBG8B+ypcMR0nkPlYaLWjBvUT9rYX1Fr2ULW4tgZNPw0zyN5pqZs L9gjCwiGYBFvc4D0UDBvedy9B29Spj81BdfrFsZO95DxwGtH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org

Hello,

this series converts all platform drivers below drivers/counter to stop
using struct platform_driver::remove(). See commit 5c5a7680e67b
("platform: Provide a remove callback that returns no value") for an
extended explanation and the eventual goal.

Both conversations are trivial, because the driver's .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, still I'd expect
them to be picked up together.

Best regards
Uwe

Uwe Kleine-König (2):
  counter: ti-ecap-capture: Convert to platform remove callback
    returning void
  counter: ti-eqep: Convert to platform remove callback returning void

 drivers/counter/ti-ecap-capture.c | 6 ++----
 drivers/counter/ti-eqep.c         | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.43.0


