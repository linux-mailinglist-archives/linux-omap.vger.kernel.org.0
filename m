Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D784FADB1
	for <lists+linux-omap@lfdr.de>; Sun, 10 Apr 2022 13:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238598AbiDJL50 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Apr 2022 07:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiDJL5Z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 10 Apr 2022 07:57:25 -0400
Received: from guaco.floridaarsonseminar.com (guaco.floridaarsonseminar.com [85.202.169.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69EF137030
        for <linux-omap@vger.kernel.org>; Sun, 10 Apr 2022 04:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=floridaarsonseminar.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; i=rae.leo@floridaarsonseminar.com;
 bh=MnUf62F7Cn+TYukvIUFpyVBy5Yk=;
 b=i2Vqh0/77J06Y6QGWOkVqy8F/CQovXyGKeIJ9eNVec+TN4WAxICQW1EYP7fzZ1TmXKSLlfUnq+Km
   u+MqxJbaAPveU9i4+bUsaF7snydVd+fwRSiDPKmuXDByJnCqG3Ldpo1RFng11EDbZwccSfz/3gaa
   0DfiFos92gvwTDDWV3KEI7PCEkzYv3O1zBIBA3G5+Wr8f4zEwNVYSuZK8FUlJkw4RlaPOheSkcTN
   90amLZHXn0o2Ro8aF/hYdrB8s1swOKbQCXtBsutVMVGYMhENtdiKo/YCniG/BkdQ9hu5RELe0tvF
   KJM+LnwC2cz7c7jZiWms2LEQdkMBr3cdOPFlLQ==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=floridaarsonseminar.com;
 b=Nk2h+T/GD5z8sR8tUZ4Noqx8l8unT/euqWWu785jiOF/JVv9Aah5NEoHhZrgWNyyIZljWQ9gEitD
   HUBZHtmXANmU8b7hCTI7aZPBHg2ir4o+cCUbOONkytWSEv6oGnwqLd6WoVWRFKPCuJ8ygLnVD+7d
   sTqs8FsV8lCf9AvGxORSbRANvw7nQbDYsHjACB77DLghaDpf94q/5yr6Z+xiKTo3IdtsbESqzYgY
   CYdefpTh+NFL1+bEoBq4xZoKZm2vg7sVtqgO1RdizcpCj4Td2xZtaiy5sAvSbxXC3uV2kJhxRvzz
   qj21cGdr1+GqhHqHxi4UX6EfFVUW+FOjhjH3TQ==;
Reply-To: ayvamustafa22@gmail.com
From:   rae.leo@floridaarsonseminar.com
To:     linux-omap@vger.kernel.org
Subject: Hello
Date:   10 Apr 2022 13:55:11 +0200
Message-ID: <20220410135511.CF03423D05A92FB5@floridaarsonseminar.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_MSPIKE_BL,
        RCVD_IN_MSPIKE_L3,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  1.3 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
        *      bl.spamcop.net
        *      [Blocked - see <https://www.spamcop.net/bl.shtml?85.202.169.206>]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [ayvamustafa22[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.9 RCVD_IN_MSPIKE_L3 RBL: Low reputation (-3)
        *      [85.202.169.206 listed in bl.mailspike.net]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 RCVD_IN_MSPIKE_BL Mailspike blacklisted
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
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
