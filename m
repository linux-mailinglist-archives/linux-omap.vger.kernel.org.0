Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 268664FAB46
	for <lists+linux-omap@lfdr.de>; Sun, 10 Apr 2022 03:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbiDJBEB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Apr 2022 21:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233703AbiDJBEA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Apr 2022 21:04:00 -0400
X-Greylist: delayed 1836 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 09 Apr 2022 18:01:48 PDT
Received: from guaco.floridaarsonseminar.com (guaco.floridaarsonseminar.com [85.202.169.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61CC1F62D
        for <linux-omap@vger.kernel.org>; Sat,  9 Apr 2022 18:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=floridaarsonseminar.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; i=rae.leo@floridaarsonseminar.com;
 bh=MnUf62F7Cn+TYukvIUFpyVBy5Yk=;
 b=iM5b+wHZMo15262X24xlyY2jImAmmVw6y/UMNY8RNwyjV/q/Z88zRXRTtUzxy8pbDFzDrn8WpEHF
   PS4MQkejNFyrtHiaCzQecYISxOhFlQyhG2kZKbUJbsMiGokG4QznI3XaPZpt0JjjpjCNlHK9u9Tf
   f9IxSDquc5v/1EtoXdcaqZggAPDXZ97RhWtnfcROksuJN8QkSvFsTEINiwR1mKyIuErTl3OLJ/3H
   bp3Sl9K+3MjFmVn1xNB2M61zJ6bcse+GsNj8D+vBdHrfKTFGgItXs2GLwfusf4E6zDlbh5cxK6Uh
   L/iTfHGT4IUk9y4iFRWwQ62TXGp8Lw+ZouKyDA==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=floridaarsonseminar.com;
 b=Y8d9xZC/QZ7rjHalZsmyF+X827sSB0WUTuKA8WYK86SIo3C8XFyf3h+m9zDjTJhMUVMFrw8fLaQF
   cWMqFiJEbcs81zamTr6oZ0D6TSeVAlxkd6ONPwzY6jonRJlGFLG1L4dNxJHvuU20B7v4YvAQ+wqQ
   u2gQYXAm/9PO9x/eD9rQAoDlHh1hgmpZyt+CLSez18xuWffWLhOdRCRz68l4mXgynY1TmGtsGVxM
   lebzoBc6Kl4UJgsQEZIHC3bIRFpNZXtjf2nlcWfiG3Bw+KRBUAKKIwhle0wvBSgdh/oPS3EcDT/K
   TFq64xmEMi7YHz3XhQQHWVGFWRMcIuCIezeKNA==;
Reply-To: ayvamustafa22@gmail.com
From:   rae.leo@floridaarsonseminar.com
To:     linux-omap@vger.kernel.org
Subject: Hello
Date:   10 Apr 2022 02:31:09 +0200
Message-ID: <20220410023109.528A51F1C4CADDE9@floridaarsonseminar.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.2 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FORGED_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L3,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  1.3 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
        *      bl.spamcop.net
        *      [Blocked - see <https://www.spamcop.net/bl.shtml?85.202.169.206>]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [ayvamustafa22[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 RCVD_IN_MSPIKE_L3 RBL: Low reputation (-3)
        *      [85.202.169.206 listed in bl.mailspike.net]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 RCVD_IN_MSPIKE_BL Mailspike blacklisted
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

sauda=C3=A7=C3=B5es ,

Estou procurando um parente do meu falecido cliente Sr. Robert,=20
que perdeu a vida devido =C3=A0 doen=C3=A7a do Coronav=C3=ADrus, que ele=20=

contraiu durante sua viagem de neg=C3=B3cios na China. Eu sou seu=20
advogado pessoal e estou procurando seus parentes mais pr=C3=B3ximos,=20
entrei em contato com voc=C3=AA para trabalhar comigo na garantia da=20
transfer=C3=AAncia de um fundo fiduci=C3=A1rio, quatro milh=C3=B5es,=20
quatrocentos e vinte mil d=C3=B3lares, legado por meu falecido=20
cliente.

Entre em contato comigo imediatamente para obter mais=20
informa=C3=A7=C3=B5es.

esperando
Mustaf=C3=A1 Aivaz
