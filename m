Return-Path: <linux-omap+bounces-3995-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92788AEF023
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 09:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E669B3E23F6
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 07:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B831A25E827;
	Tue,  1 Jul 2025 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=growora.pl header.i=@growora.pl header.b="TEMInc9Z"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.growora.pl (mail.growora.pl [51.254.119.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2D25D53C
	for <linux-omap@vger.kernel.org>; Tue,  1 Jul 2025 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.254.119.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751356320; cv=none; b=m0pKKKgjC4isQK1xSNevD9MkDbY8r2p8d93FZnGOaw3YjFQm/th233xXhYfw042seY5k+Hx8oDYMYBKaO0w3wSgQMdss+hflFg2wl6oUW934IN07p++jpauGwNHA92piZ9neSDArkZcQvcUzmKAUV7J86W+Y5FrQv+En/UHdwZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751356320; c=relaxed/simple;
	bh=EB99enkNQ3/lKc2PdUObvM5/Gi3NF8gZrWwaTOp5KYs=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=BF3uGQShukkcsbyTt8rwVP+D2xxk7Rwxjgy5EAyYWuwf4UjegpOdKmU5zkJlO2LIPge95+bfyNkA2Dv8wTk4A1W9xqt1+ZRI2fuioh9SzX+ISIuC8orLsVAD7FNfpx2y36ltz+dsJNf/EQT1S37if+Z69W5oSJXTovdx23hbXXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=growora.pl; spf=pass smtp.mailfrom=growora.pl; dkim=pass (2048-bit key) header.d=growora.pl header.i=@growora.pl header.b=TEMInc9Z; arc=none smtp.client-ip=51.254.119.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=growora.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=growora.pl
Received: by mail.growora.pl (Postfix, from userid 1002)
	id 50C1923C24; Tue,  1 Jul 2025 09:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growora.pl; s=mail;
	t=1751356308; bh=EB99enkNQ3/lKc2PdUObvM5/Gi3NF8gZrWwaTOp5KYs=;
	h=Date:From:To:Subject:From;
	b=TEMInc9ZSvpmJIJ9RgSYB6lUw5bQovYOFOVsw3g6T2iegKBAhOZo//JNrIlbSgGJP
	 6K5n8+fP/btfbkNrxBJOXc4Q/MI4kIrFtImFutn26lvgqveEQZMFmahdQZPgEXqCX+
	 EOp6R+mqc6SFJBSlscibzhe2yEvKkIycmQvWMSQOhGPSAkPAO1I5sd58YL2WjnTcVP
	 anpzEDfxB4QVpeZFHDS2/IssS/wRDUKlxzDsxg09t71DXUZXdG4qPo5tZGrSlN1cSJ
	 sxUKbrr/oFSpr3VUejxo02C8QPNAOaVFAWnLwiHCCRtk+onYq8HlCCbXyX+YTPanaE
	 vAfxWNel1SUQw==
Received: by mail.growora.pl for <linux-omap@vger.kernel.org>; Tue,  1 Jul 2025 07:50:34 GMT
Message-ID: <20250701084500-0.1.kc.23bmq.0.2d80l4kc40@growora.pl>
Date: Tue,  1 Jul 2025 07:50:34 GMT
From: "Mateusz Hopczak" <mateusz.hopczak@growora.pl>
To: <linux-omap@vger.kernel.org>
Subject: IT bez rekrutacji
X-Mailer: mail.growora.pl
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cze=C5=9B=C4=87,

wiem, =C5=BCe rozw=C3=B3j oprogramowania to dzi=C5=9B nie tylko kwestia t=
echnologii, ale tempa i dost=C4=99pno=C5=9Bci odpowiednich ludzi.=20

Je=C5=9Bli temat dotyczy r=C3=B3wnie=C5=BC Pa=C5=84stwa zespo=C5=82u, by=C4=
=87 mo=C5=BCe warto porozmawia=C4=87 o wsp=C3=B3=C5=82pracy, w kt=C3=B3re=
j to my przejmujemy ca=C5=82y proces tworzenia oprogramowania =E2=80=93 o=
d analizy po utrzymanie. Pracujemy elastycznie, dostosowuj=C4=85c si=C4=99=
 do wewn=C4=99trznych procedur i Waszego stacku technologicznego.

Dzia=C5=82amy tak, jakby=C5=9Bmy byli cz=C4=99=C5=9Bci=C4=85 zespo=C5=82u=
, ale bez operacyjnego ci=C4=99=C5=BCaru, ryzyka kosztownych rekrutacji, =
z elastycznym podej=C5=9Bciem i transparentnym modelem rozlicze=C5=84.

Czy jeste=C5=9Bcie Pa=C5=84stwo zainteresowani pog=C5=82=C4=99bieniem tem=
atu?


Pozdrawiam
Mateusz Hopczak

