Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79A4252A75F
	for <lists+linux-omap@lfdr.de>; Tue, 17 May 2022 17:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241610AbiEQPvv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 May 2022 11:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350715AbiEQPvD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 May 2022 11:51:03 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AD5506D0
        for <linux-omap@vger.kernel.org>; Tue, 17 May 2022 08:51:00 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id t11-20020a17090a6a0b00b001df6f318a8bso2849667pjj.4
        for <linux-omap@vger.kernel.org>; Tue, 17 May 2022 08:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sq17Edx2+CFT11B0EldvF6Xr2vsCgtJUsQIXxAbj7HI=;
        b=YagzcbA0G2v4PjgIfWwGfW5R5OQtPYHgOuCYM8YDVkXHjkRcckMEoB2ewCfNGpyST1
         Cro1eqxO2ZMUYby+Iz+G4EDD9Th0mz6aE8yxXxT0i9cN1x2TsKztrFU1h+7EYLiSVOHj
         nDbvCbw66qwalMpIvZfKlVY8bQgfttr6RqZy6+2sxXS9nMowhsIik1uE9s7RlD8b4Ds9
         b77vK+TOBFWacjODZiFQEWaDn+pl2PL+QHnKcqf1SXBWRLvw0bRrKN9HfPiLa3gejnTN
         tl9oHRm496fY0DjYKb16HIZAtqYLELfCcnz/d2Y1xBMu4gXYVJ/5g5Yz65G7jXDJKTtJ
         l4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sq17Edx2+CFT11B0EldvF6Xr2vsCgtJUsQIXxAbj7HI=;
        b=DExBn6CvyzrPzxrQHr18nhJlxmon1l1lIPXLkbMcziO/iIf01Y8xnOSbVQ9NIQ3bJV
         XxaCEwstvJKU+/rdT2vMtE0Q6l0QTvK0cuZarkqhJSbtLpPH5+bDFh4HDuTl8D1zKUAi
         P/UAB54XN/pgf9pDZvIlbLzuYAJX0GLSaFBJ+Ic/o8JvowI7SMMJ5wQqQJAm1MGDBwuj
         9YYhODuJpeASAoeYDd5EBq77UBs6riYij8gcGeI90MNvmtxk0ehKG54D+VgCaSW7Gxv/
         VmX0EzLQPtDcXQPrq+xrqYNBFEvyC8+aVtTItA6XiW3YhnDxACAnCpGuL4qAB4Nx5xc9
         xA0w==
X-Gm-Message-State: AOAM5312OUvv4vvt6ME5sJLmNtZHeNjCNeFTuhq7Ewhx03ScTV6X4j73
        SdZsw/f1h70a3bYK6C1E6I5+L3tW9wmoovzU/m4=
X-Google-Smtp-Source: ABdhPJwILvkaPqnQMxESyFGDCX1DZKIyZsMXVgFn6t1gP8wuO3clIbcbEZXzm7dEUf6iJrI2KX2L4VtKByQKcUXH/Gk=
X-Received: by 2002:a17:903:40c5:b0:15e:c7e9:8ae8 with SMTP id
 t5-20020a17090340c500b0015ec7e98ae8mr22515926pld.151.1652802660241; Tue, 17
 May 2022 08:51:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:d2c7:b0:7f:757b:3407 with HTTP; Tue, 17 May 2022
 08:50:59 -0700 (PDT)
Reply-To: msbelinaya892@gmail.com
From:   msbelinaya <huisterlui75@gmail.com>
Date:   Tue, 17 May 2022 15:50:59 +0000
Message-ID: <CAAcQqWheDEmNyTJvSsCKDpmxuOVALheMBEecrjeBM8Kh-zwhGA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1035 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [huisterlui75[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [huisterlui75[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [msbelinaya892[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.1 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  1.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Ik bied mijn vriendschap aan en geloof dat je me met een goed hart
zult accepteren. Ik werd dringend verzocht contact met u op te nemen
om te kijken hoe we elkaar het beste kunnen ondersteunen. Ik ben
mevrouw Kodjovi Hegbor uit Turkije en ik werk als Operations Division
Manager bij StandardBNP bank limited Turkey. Ik geloof dat het Gods
wil is dat ik je nu zal ontmoeten. Ik heb een belangrijk zakelijk
gesprek dat ik met u wil delen en waarvan ik denk dat u hierin
ge=C3=AFnteresseerd zult zijn, aangezien het verband houdt met uw
achternaam en u er baat bij zult hebben.

 In 2006 opende een burger van uw land een 36-maands niet-ingezetene
rekening van de kalender bij mijn bank ter waarde van =C2=A3 8.400.000,00.
De vervaldatum voor deze stortingsovereenkomst was 16 januari 2009.
Helaas stierf hij bij een fatale aardbeving op 12 mei 2008 in Sichuan,
China, waarbij ten minste 68.000 mensen omkwamen tijdens een
zakenreis.

Het management van mijn bank heeft nog niet van zijn overlijden
gehoord, ik wist ervan omdat hij mijn vriend was en ik zijn
accountmanager was toen de rekening werd geopend v=C3=B3=C3=B3r mijn promot=
ie.
Maar meneer
 vermeldde bij het openen van een rekening geen
nabestaanden/erfgenamen en hij was niet getrouwd of had geen kinderen.
Vorige week vroeg mijn bankdirectie me instructies te geven over wat
ik met zijn geld moest doen als het contract zou worden verlengd.

Ik weet dat dit gaat gebeuren en daarom ben ik op zoek geweest naar
een manier om met de situatie om te gaan, want als mijn
bankdirecteuren weten dat ze dood zijn en geen erfgenaam hebben, nemen
ze het geld aan voor persoonlijk gebruik, sommigen niet Ik wil niet
dat zoiets gebeurt. Dat was toen ik uw achternaam zag, ik was blij en
vraag nu uw medewerking om u voor te stellen als de
nabestaanden/erfgenaam van de rekening, aangezien u dezelfde
achternaam als hij heeft en mijn bankhoofdkantoor de rekening zal
vrijgeven voor jij. Er is geen risico; de transactie wordt uitgevoerd
onder een legitieme overeenkomst die u beschermt tegen juridische
inbreuken.

Het is beter dat we het geld opeisen dan de bankdirecteuren het te
laten afnemen, ze zijn al rijk. Ik ben geen hebzuchtige persoon, dus
ik stel voor dat we het geld gelijk verdelen, 50/50% over beide
partijen. Met mijn aandeel kan ik mijn eigen bedrijf starten en de
opbrengst gebruiken voor het goede doel, wat mijn droom was.

Geef me alsjeblieft je mening over mijn suggestie, ik heb echt je hulp
nodig bij deze transactie. Ik heb je gekozen om me te helpen, niet
door mijn eigen toedoen, mijn liefste, maar door God, ik wilde dat je
weet dat ik de tijd nam om over deze boodschap te bidden voordat ik
ooit contact met je opnam om je te delen, geef me je mening, en
alsjeblieft behandel deze informatie als TOP SECRET. Na ontvangst van
uw antwoord, uitsluitend via mijn persoonlijke e-mailadres,
msbelinaya892@gmail.com
geeft u details van de transactie. En een kopie van het
depositocertificaat van het fonds en de oprichtingsakte van het
bedrijf dat het fonds heeft opgericht.
God zegene in afwachting van uw dringende reactie
Vriendelijke groeten
Mevr. Kodjovi Hegbor
msbelinaya892@gmail.com
