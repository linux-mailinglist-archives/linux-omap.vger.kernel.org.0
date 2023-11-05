Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32D7A7E173E
	for <lists+linux-omap@lfdr.de>; Sun,  5 Nov 2023 23:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjKEWBD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Nov 2023 17:01:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjKEWBB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Nov 2023 17:01:01 -0500
X-Greylist: delayed 5264 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 14:00:58 PST
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC5FCC
        for <linux-omap@vger.kernel.org>; Sun,  5 Nov 2023 14:00:58 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id 019BB18E6A;
        Mon,  6 Nov 2023 01:57:36 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id EF95A1911A;
        Mon,  6 Nov 2023 01:57:35 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 8BB021B8204A;
        Mon,  6 Nov 2023 01:57:37 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id kC-GmhiB7aRV; Mon,  6 Nov 2023 01:57:37 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 5A6701B82534;
        Mon,  6 Nov 2023 01:57:37 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn 5A6701B82534
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210657;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=ZT/8LjGXr5CmMfY5Bt3KQ1kOuUwvnuVFSNfA8AGrfaWVY/CeXgyarkpBD5HXKtT45
         OiQMrULHK1BTcAVaWk3zOHQ+1WA77+NF/JggRuWPynAiJH2p/5+GrzOSKZK+nH+MuA
         +To5WFHSdCkNIwOJH6MNit/kZp7hohQiO/8ksDMB0XnMjzk0A69HTIIspOsjGdqUlz
         /7+0mohHSLXXGtWf4MqLbYnlcAo8fPincSyu2ZWYa3Zw+ySSfzHMZHRz8SNA9PTf0Q
         HbFstyrphBB9a6FcHKlQIX/a1/AMKAaDBBpI0ACx4NHOP9vpVcHrAUdKwNgrDn8hSQ
         nR95gSC43xvWQ==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 4Z6BNnmh7beA; Mon,  6 Nov 2023 01:57:37 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id 1C6D31B82538;
        Mon,  6 Nov 2023 01:57:30 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:57:20 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185731.1C6D31B82538@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

