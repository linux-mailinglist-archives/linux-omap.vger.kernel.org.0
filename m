Return-Path: <linux-omap+bounces-4157-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A49F4B159B0
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jul 2025 09:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAF69548292
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jul 2025 07:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E396E28EA4B;
	Wed, 30 Jul 2025 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=launchiq.pl header.i=@launchiq.pl header.b="dAJGqbqa"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.launchiq.pl (mail.launchiq.pl [57.129.61.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E841990D8
	for <linux-omap@vger.kernel.org>; Wed, 30 Jul 2025 07:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.61.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753861055; cv=none; b=DjZ8gArjS3V7Wdh0bKthlEHYEAcY97F5o9Ev/fjW2zxH3jx43zk5KBkO5qDzgnunp+5Xpvh+PfEhSqOmKK1QOJz9kq9tTY8vV6mYe9PBSbAStjMacT8tIJcWAKdl74omZpT+F5xdOt3VStxaf8Ed/L0cg+1mUClMuI8EZJf87gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753861055; c=relaxed/simple;
	bh=1nV56yiRn7w88ZKIfi9xMzQzsEglWEb9KKVoIWzOJTA=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=fRWq/KZglucJs4If2826VPc0+R2zHyBo9ZXmixcKrhj4k45VsRwGmBaeg0Nk2AT75ZwDCVpqa9tTFpPHQO5vZhCWCqpjdvupAT9c1RqiZe7Rgx7nMujcdVmFAqdjNl8YAlWssnOBokFsXkjaJc1xy6LINP+BdWDD3Iob6013JVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=launchiq.pl; spf=pass smtp.mailfrom=launchiq.pl; dkim=pass (2048-bit key) header.d=launchiq.pl header.i=@launchiq.pl header.b=dAJGqbqa; arc=none smtp.client-ip=57.129.61.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=launchiq.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=launchiq.pl
Received: by mail.launchiq.pl (Postfix, from userid 1002)
	id 6D58F241C7; Wed, 30 Jul 2025 07:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=launchiq.pl; s=mail;
	t=1753861049; bh=1nV56yiRn7w88ZKIfi9xMzQzsEglWEb9KKVoIWzOJTA=;
	h=Date:From:To:Subject:From;
	b=dAJGqbqaMEskXlP0PUgMLsltdrGn3zTrsTaYoGQRAG0kXkd1WqPyfETIcsCKbKLGu
	 R6/DYQX7kqvyttP7nc/XJPajNpC2t0fkSGJJZMfbpX4pNX7hvrXLXR8q//FCB1trup
	 b/UkvvmrCD/l70kpYoZQXrrQWGRi7a463xtMLipdS3+SLZm4yxSvYsuyv+szruUjma
	 ecax7+3lMii0hrd/2+OiESTFxVTbPSb5Tgwq6TaREStOv/4oCFWpSdB5IsB5Q6Rel1
	 coHVNqogXf1g6mQHLb+6P4I6RNBU3wUje4MLSzixC6T1BN5g52G0vQPHN64cKxnZJF
	 1cU/Yay4V7KXA==
Received: by mail.launchiq.pl for <linux-omap@vger.kernel.org>; Wed, 30 Jul 2025 07:36:06 GMT
Message-ID: <20250730064500-0.1.3n.a6x7.0.tbjf93hqt3@launchiq.pl>
Date: Wed, 30 Jul 2025 07:36:06 GMT
From: "Grzegorz Sutor" <grzegorz.sutor@launchiq.pl>
To: <linux-omap@vger.kernel.org>
Subject: Umowa vPPA - termin spotkania
X-Mailer: mail.launchiq.pl
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dzie=C5=84 dobry,

mamy rozwi=C4=85zanie, kt=C3=B3re pozwala zabezpieczy=C4=87 korzystn=C4=85=
 cen=C4=99 energii na d=C5=82ugie lata =E2=80=94 bez konieczno=C5=9Bci zm=
iany obecnego dostawcy i bez inwestycji w instalacje odnawialne.

Proponujemy wsp=C3=B3=C5=82prac=C4=99 w oparciu o wirtualne umowy PPA (vP=
PA) =E2=80=93 to rozliczany finansowo kontrakt oparty na cenach SPOT, kt=C3=
=B3ry:

=E2=80=A2 stabilizuje koszty energii na 3 do 7 lat,
=E2=80=A2 wspiera realizacj=C4=99 polityki ESG i obni=C5=BCa =C5=9Blad w=C4=
=99glowy,
=E2=80=A2 zapewnia elastyczno=C5=9B=C4=87 zakupow=C4=85 =E2=80=93 cz=C4=99=
=C5=9B=C4=87 energii w sta=C5=82ej cenie z OZE, reszta  =20
  rozliczana na bie=C5=BC=C4=85co,
=E2=80=A2 nie wymaga zmian technicznych ani formalnych po stronie Pa=C5=84=
stwa firmy.

Wsp=C3=B3=C5=82pracujemy z przedsi=C4=99biorstwami zu=C5=BCywaj=C4=85cymi=
 od 3 do 30 GWh rocznie =E2=80=93 g=C5=82=C3=B3wnie z bran=C5=BC takich j=
ak przemys=C5=82, logistyka, handel, automotive, IT i data center.

Ch=C4=99tnie przygotujemy bezp=C5=82atn=C4=85 wycen=C4=99 i indywidualn=C4=
=85 propozycj=C4=99 kontraktu, dostosowan=C4=85 do profilu zu=C5=BCycia e=
nergii w Pa=C5=84stwa firmie.

Je=C5=9Bli temat jest dla Pa=C5=84stwa interesuj=C4=85cy, z przyjemno=C5=9B=
ci=C4=85 przeka=C5=BC=C4=99 wi=C4=99cej informacji lub um=C3=B3wi=C4=99 s=
potkanie z naszym specjalist=C4=85.


Z wyrazami szacunku.
Grzegorz Sutor

