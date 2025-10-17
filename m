Return-Path: <linux-omap+bounces-4688-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB4BE8BB8
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 15:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7AC93BACF4
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 13:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE993451B3;
	Fri, 17 Oct 2025 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b="XSiKaj81"
X-Original-To: linux-omap@vger.kernel.org
Received: from manage.vyzra.com (unknown [104.128.60.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C47342C8A
	for <linux-omap@vger.kernel.org>; Fri, 17 Oct 2025 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.128.60.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706310; cv=none; b=IHLX8j0CVPnbyK5b4aC4z8UJs9qB7v+g3u8PDuCmnxn2Vl6Ur3FsW1FDb/1faUpcrSn5YPFa2NBYtq2schQNXoiVU96sDhTZTGCcGACrg5DcxEeD8tW/w8RScpom8wiEgtm5tyR4zl6mlKFb36SZebFvmYCKEqngM1ea7+9C460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706310; c=relaxed/simple;
	bh=biLnUx9jTTyVdIbdiavoTAgEZeIqqOihfb373MH/e18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eVMwMjWP+Fna+tr+c08bVkeWSvhhUpxd/ioIbqRS9XcEgywKefNtuxyyNuzfv0FEwGfhZ76zt5GEbxHcz0ynpguHFB6EYg0v4MGscdksKafzvLbHrF6ukSoRDeY3zOYJyc+4s8teTZG2IQByVIyosnTjtl7+lhlbBkwnP40CP0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org; spf=none smtp.mailfrom=manage.vyzra.com; dkim=fail (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b=XSiKaj81 reason="key not found in DNS"; arc=none smtp.client-ip=104.128.60.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=manage.vyzra.com
Received: from debtmanager.org (unknown [103.237.86.103])
	by manage.vyzra.com (Postfix) with ESMTPA id 471BA533803E
	for <linux-omap@vger.kernel.org>; Fri, 17 Oct 2025 07:45:34 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debtmanager.org;
	s=DKIM2021; t=1760705134; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Aj8bDacQlJB5qNMC5+yWWged1+K/M8YReXQkzUminbQ=;
	b=XSiKaj814AK5TJFkN72/kBhtEw+aDdehjyRvlYUumagxR3zjjP9zqyFLsjEhvUzzcJCNyj
	piwVDpqxWllyxwvSFM9qu8WaFz9Lr6L5cZgZDUU3uY+v8dzYtCgUufKawPId86G/K+kesd
	FdcEdB8x20XZCFSRauH+lHJa20igwkFNOfYQxU2Sj8+7Uq6kazYi4FJCdlmicEOI6geCTJ
	dojpUDNxexlKHKpROD5T8EBdw9UhLLZkeor1q2H1iXL8qdos0/wmyKpEgO0Sbbe/Hn+WpZ
	gHvhkS+T/r0kQUZnzbBRB1H6oZ9zZPN2HSnXS8SW7xbM0NyVXRU8eIzB2tFg5w==
Reply-To: vlad.dinu@rdslink.ro
From: "Vlad Dinu" <info@debtmanager.org>
To: linux-omap@vger.kernel.org
Subject: *** Urgent Change ***
Date: 17 Oct 2025 05:45:33 -0700
Message-ID: <20251017054533.4021FCE5ACC34F41@debtmanager.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -0.10

Hello,

I am Vlad Dinu, the newly appointed Director of IMF Legal=20
Affairs, Security and Investigation. I have been given the=20
responsibility to look into all the payments that are still=20
pending and owed to fund beneficiaries / scam victims worldwide.

This action was taken because there have been issues with some=20
banks not being able to send or release money to the correct=20
beneficiary accounts. We have found out that some directors in=20
different organizations are moving pending funds to their own=20
chosen accounts instead of where they should go.

During my investigation, I discovered that an account was=20
reported to redirect your funds to a bank in Sweden.
The details of that account are provided below. I would like you=20
to confirm if you are aware of this new information, as we are=20
now planning to send the payment to the account mentioned.

NAME OF BENEFICIARY: ERIK KASPERSSON
BANK NAME: SWEDBANK AB
ADDRESS: REPSLAGAREGATAN 23A, 582 22 LINK=C3=96PING, SWEDEN
SWIFT CODE: SWEDSESS
ACCOUNT NUMBER: 84806-31282205


A payment instruction has been issued by the Department of=20
Treasury for an immediate release of your payment to the bank=20
account above without further prejudice. We cannot approve or=20
schedule payment to the 

given bank account without your confirmation. May we proceed with=20
the transfer to the Beneficiary: Erik Kaspersson, bank account in=20
Sweden?

I await your urgent response.

Mr. Vlad Dinu.

