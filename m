Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B890732976
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jun 2023 10:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232573AbjFPIEn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Jun 2023 04:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245098AbjFPIEh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Jun 2023 04:04:37 -0400
Received: from mail.durme.pl (mail.durme.pl [217.182.69.186])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED93295B
        for <linux-omap@vger.kernel.org>; Fri, 16 Jun 2023 01:04:13 -0700 (PDT)
Received: by mail.durme.pl (Postfix, from userid 1002)
        id E22304D1EB; Fri, 16 Jun 2023 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=durme.pl; s=mail;
        t=1686902545; bh=hFxZwVw4rIL+JwfEOGI47p+fdoVOAeqVswP6NWoHSHQ=;
        h=Date:From:To:Subject:From;
        b=mi3iGJUrpmyGcFsBKwB8MAZoJmdjdIttL6uAX6Y0EwGGCUX0rNEeLxSxX0YNCAGOh
         BdU4Qu5IJZfl/qzrmv+1Z2FJzh/+7f4FYly207MG+bLSal/+gOPrzc/On41vEK/c8l
         IyPEbBF9BWA4nEM5LJ4ryp6nVSUNqZJkniJaq/QQ8cMha+ghPkxxetHhmcnVSbEhTk
         OIxjseVw+8bddHc7uqB1WYZ2KKg/jWpl1JO1GwEm9rrrEmAVNbFqGaYnPSxA/y0hIb
         ZYYitR6gcMFLpf67ZMoOsr08Xc88t1qPSV6BEkYg/gUAWaiaLzQhCK0D1ldrJiSrwo
         +xSzQ6yUdEySQ==
Received: by mail.durme.pl for <linux-omap@vger.kernel.org>; Fri, 16 Jun 2023 08:00:46 GMT
Message-ID: <20230616064502-0.1.2j.bich.0.rc360e12c5@durme.pl>
Date:   Fri, 16 Jun 2023 08:00:46 GMT
From:   "Krystian Wieczorek" <krystian.wieczorek@durme.pl>
To:     <linux-omap@vger.kernel.org>
Subject: W sprawie samochodu
X-Mailer: mail.durme.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED,URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: durme.pl]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: durme.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [217.182.69.186 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: durme.pl]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  1.3 RCVD_IN_VALIDITY_RPBL RBL: Relay in Validity RPBL,
        *      https://senderscore.org/blocklistlookup/
        *      [217.182.69.186 listed in bl.score.senderscore.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Dzie=C5=84 dobry,

chcieliby=C5=9Bmy zapewni=C4=87 Pa=C5=84stwu kompleksowe rozwi=C4=85zania=
, je=C5=9Bli chodzi o system monitoringu GPS.

Precyzyjne monitorowanie pojazd=C3=B3w na mapach cyfrowych, =C5=9Bledzeni=
e ich parametr=C3=B3w eksploatacyjnych w czasie rzeczywistym oraz kontrol=
a paliwa to kluczowe funkcjonalno=C5=9Bci naszego systemu.=20

Organizowanie pracy pracownik=C3=B3w jest dzi=C4=99ki temu prostsze i bar=
dziej efektywne, a oszcz=C4=99dno=C5=9Bci i optymalizacja w zakresie pono=
szonych koszt=C3=B3w, maj=C4=85 dla ka=C5=BCdego przedsi=C4=99biorcy ogro=
mne znaczenie.

Dopasujemy nasz=C4=85 ofert=C4=99 do Pa=C5=84stwa oczekiwa=C5=84 i potrze=
b organizacji. Czy mogliby=C5=9Bmy porozmawia=C4=87 o naszej propozycji?


Pozdrawiam
Krystian Wieczorek
