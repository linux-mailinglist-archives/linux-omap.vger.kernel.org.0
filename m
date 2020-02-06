Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44E8E153CF6
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2020 03:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgBFCbD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Feb 2020 21:31:03 -0500
Received: from smtp4.tjgo.jus.br ([45.71.214.102]:45158 "EHLO mx2.tjgo.jus.br"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727307AbgBFCbD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 5 Feb 2020 21:31:03 -0500
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Feb 2020 21:31:02 EST
Received: from sv-email-p02.tjgo.jus.br (sv-email-p02.tjgo.jus.br [45.71.214.97])
        by mx2.tjgo.jus.br (Postfix) with ESMTPS id 094EF1B8118;
        Wed,  5 Feb 2020 23:24:14 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
        by sv-email-p02.tjgo.ldc (Postfix) with ESMTP id 3E9626408F;
        Wed,  5 Feb 2020 23:24:13 -0300 (-03)
Received: from sv-email-p02.tjgo.jus.br ([127.0.0.1])
        by localhost (sv-email-p02.tjgo.ldc [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id vxXMYpxAWvle; Wed,  5 Feb 2020 23:24:12 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
        by sv-email-p02.tjgo.ldc (Postfix) with ESMTP id 11533640AA;
        Wed,  5 Feb 2020 23:24:11 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.10.3 sv-email-p02.tjgo.ldc 11533640AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tjgo.jus.br;
        s=DB6EB6C0-19CB-11E9-B608-74AECE7D716B; t=1580955851;
        bh=N7ic5LlI94J/87ZUuJbnr2MyW1XAh52HpvlLWUizZd4=;
        h=Date:From:Message-ID:MIME-Version;
        b=k+XIEBVaBg+jiHtRrGcTtm5JYuUlYL5jWrGXy/x7ZUJ7B02yB+qMyYz2YSE+WU2Nh
         Sa0oh/xqWrZbf38yvSkoOd68OtXmfYppXJpsphPiELS6ysbUMLyUarKZu/WwgqU4Di
         XUa3srwKOFFpD0eNsi9URIUYZ3kFaUfnZq9d4yOQjUQUKk+LiUHjs9zeG3EhQjXNBQ
         zx0j4sdE2QCdDxLVGwxjksjyYMHt6aJTaBmB4KKiMt0ib3TtBd6zAr9bYBQwNuMn1t
         JwlP04apVemUdX9VI0fk7N8kGjWTvbaxtTDeSVLxA5rLv1e7Wj1dcQfKdZRE48pB1R
         brVzqRplzj3iw==
X-Virus-Scanned: amavisd-new at sv-email-p02.tjgo.ldc
Received: from sv-email-p02.tjgo.jus.br ([127.0.0.1])
        by localhost (sv-email-p02.tjgo.ldc [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id bY1aEiBKi6n8; Wed,  5 Feb 2020 23:24:10 -0300 (-03)
Received: from sv-email-p00.tjgo.ldc (sv-email-p00.tjgo.ldc [45.71.214.95])
        by sv-email-p02.tjgo.ldc (Postfix) with ESMTP id A50BE6396B;
        Wed,  5 Feb 2020 23:24:06 -0300 (-03)
Date:   Wed, 5 Feb 2020 23:24:06 -0300 (BRT)
From:   Viviane Jose Pereira <vjpereira@tjgo.jus.br>
Reply-To: Tom Crist <cristtom063@gmail.com>
Message-ID: <1173890889.972674.1580955846426.JavaMail.zimbra@tjgo.jus.br>
Subject: Re:
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [185.220.101.56]
X-Mailer: Zimbra 8.8.15_GA_3829 (zclient/8.8.15_GA_3829)
Thread-Index: tyCuo3BFHLoLJ74gIWjZGW6Qvok8UQ==
Thread-Topic: 
X-HSC-Mail_Inspector-From: vjpereira@tjgo.jus.br
X-HSC-Mail_Inspector-IP: 45.71.214.97
X-HSC-Mail_Inspector-Point: 2
X-HSC-Mail_Inspector-ID: 094EF1B8118.AAB33
X-HSC-Brasil-HSC_MailInspector: Mensagem OK
X-HSC-Brasil-HSC_MailInspector-SpamCheck: Nao e SPAM,
        HSC MailInspector (cached, Pontuacao=5.168, requerido 6,
        BAYES_00 -3.00, DKIM_VALID_AU -0.10, HELO_NO_DOMAIN 0.00,
        HSC_MAIL_REPUTATION 4.90, LOTS_OF_MONEY 0.00, MISSING_HEADERS 1.02,
        RDNS_NONE 0.79, REPLYTO_WITHOUT_TO_CC 1.55)
X-HSC-Brasil-HSC_MailInspector-SpamScore: 5
X-HSC-Brasil-HSC_MailInspector-From: vjpereira@tjgo.jus.br
X-Spam-Status: No
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



--=20
Hallo, ich entschuldige mich daf=C3=BCr, dass ich deine Privatsph=C3=A4re g=
est=C3=B6rt habe. Ich kontaktiere Sie f=C3=BCr eine =C3=A4u=C3=9Ferst dring=
ende und vertrauliche Angelegenheit.

Ihnen wurde eine Spende von 15.000.000,00 EUR angeboten Kontakt: cristtom06=
3@gmail.com f=C3=BCr weitere Informationen.

Dies ist keine Spam-Nachricht, sondern eine wichtige Mitteilung an Sie. Ant=
worten Sie auf die obige E-Mail, um immer mehr Informationen =C3=BCber die =
Spende und den Erhalt von Geldern zu erhalten.
